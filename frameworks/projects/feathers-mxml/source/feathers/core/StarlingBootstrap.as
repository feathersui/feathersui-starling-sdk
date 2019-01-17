/*
Feathers SDK
Copyright 2012-2019 Bowler Hat LLC

See the NOTICE file distributed with this work for additional information
regarding copyright ownership. The author licenses this file to You under the
Apache License, Version 2.0 (the "License"); you may not use this file except in
compliance with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
*/
package feathers.core
{
	import feathers.themes.IAsyncTheme;
	import feathers.utils.ScreenDensityScaleFactorManager;

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;

	import starling.core.Starling;
	import starling.errors.AbstractMethodError;
	import starling.events.Event;
	import starling.utils.SystemUtil;

	/**
	 * @private
	 */
	public class StarlingBootstrap extends MovieClip
	{
		/**
		 * Constructor.
		 */
		public function StarlingBootstrap()
		{
			this.stop();
			if(this.stage)
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}
			this.loaderInfo.addEventListener(flash.events.Event.COMPLETE, loaderInfo_completeHandler);
		}

		/**
		 * @private
		 */
		protected var _starling:Starling;

		/**
		 * The Starling instance.
		 */
		public function get starling():Starling
		{
			return this._starling;
		}

		/**
		 * @private
		 */
		protected var _scaler:ScreenDensityScaleFactorManager;
		
		/**
		 * @private
		 * The compiler will override this function.
		 */
		public function info():Object
		{
			throw new AbstractMethodError();
		}

		/**
		 * @private
		 */
		protected function createStarling():Starling
		{
			var info:Object = this.info();
			var context3DProfile:String;
			if(info.hasOwnProperty("context3DProfile"))
			{
				context3DProfile = info["context3DProfile"] as String;
			}
			if(!context3DProfile)
			{
				//pick a reasonable default
				context3DProfile = "auto";
			}
			var skipUnchangedFrames:Boolean = true;
			if(info.hasOwnProperty("skipUnchangedFrames"))
			{
				skipUnchangedFrames = info["skipUnchangedFrames"] === "true";
			}
			var shareContext:Boolean = false;
			if(info.hasOwnProperty("shareContext"))
			{
				shareContext = info["shareContext"] === "true";
			}
			var showStats:Boolean = false;
			if(info.hasOwnProperty("showStats"))
			{
				showStats = info["showStats"] === "true";
			}
			var antiAliasing:int = 0;
			if(info.hasOwnProperty("antiAliasing"))
			{
				antiAliasing = parseInt(info["antiAliasing"], 10);
			}
			Starling.multitouchEnabled = true;
			var starling:Starling = new Starling(null, this.stage, null, null, Context3DRenderMode.AUTO, context3DProfile);
			starling.antiAliasing = antiAliasing;
			starling.supportHighResolutions = this.stage.contentsScaleFactor > 1;
			starling.shareContext = shareContext;
			starling.skipUnchangedFrames = skipUnchangedFrames;
			starling.showStats = showStats;
			return starling;
		}

		/**
		 * @private
		 */
		protected function createTheme():Object
		{
			var themeClassName:String = info()["themeClassName"] as String;
			if(!themeClassName)
			{
				return null;
			}
			var themeClass:Class = Class(getDefinitionByName(themeClassName));
			return new themeClass();
		}

		/**
		 * @private
		 */
		protected function setRootClass():void
		{
			var rootClassName:String = info()["rootClassName"] as String;
			if(rootClassName == null)
			{
				var url:String = loaderInfo.loaderURL;
				var dot:int = url.lastIndexOf(".");
				var slash:int = url.lastIndexOf("/");
				rootClassName = url.substring(slash + 1, dot);
			}
			var rootClass:Class = Class(getDefinitionByName(rootClassName));
			this._starling.rootClass = rootClass;
		}

		/**
		 * @private
		 */
		protected function setupScaling():void
		{
			this._scaler = new ScreenDensityScaleFactorManager(this._starling);
		}

		/**
		 * @private
		 */
		protected function initializeMixins():void
		{
			//the mixins property of the info object is populated by the
			//compiler from classes with [Mixin] metadata.
			var mixinList:Array = info()["mixins"] as Array;
			if(mixinList && mixinList.length > 0)
			{
				var mixinCount:int = mixinList.length;
				for(var i:int = 0; i < mixinCount; i++)
				{
					var c:Class = Class(getDefinitionByName(mixinList[i]));
					//we're a little more careful than Flex because we check if
					//an init member exists and ensure that it's a function
					//before we call it. we also check the number of arguments
					//that are accepted.
					if("init" in c)
					{
						var init:Function = c["init"] as Function;
						if(init != null)
						{
							if(init.length === 0)
							{
								init();
							}
							else if(init.length === 1)
							{
								//try to use mixins that are designed for the
								//Flex compiler. it may not work because some
								//mixins expect the root to implement the
								//IFlexModuleFactory interface.
								init(this);
							}
						}
					}
				}
			}
		}

		/**
		 * @private
		 */
		protected function deactivateHandler(event:flash.events.Event):void
		{
			this._starling.stop(true);
		}

		/**
		 * @private
		 */
		protected function activateHandler(event:flash.events.Event):void
		{
			this._starling.start();
		}

		/**
		 * @private
		 */
		protected function loaderInfo_completeHandler(event:flash.events.Event):void
		{
			this._starling = this.createStarling();
			this.setupScaling();
			this._starling.addEventListener(starling.events.Event.CONTEXT3D_CREATE, starling_context3DCreateHandler);
			if(!SystemUtil.isDesktop)
			{
				//on mobile, Starling should not render while in the background
				this.addEventListener(flash.events.Event.DEACTIVATE, deactivateHandler);
				this.addEventListener(flash.events.Event.ACTIVATE, activateHandler);
			}
		}

		/**
		 * @private
		 */
		protected function starling_context3DCreateHandler(event:starling.events.Event):void
		{
			this._starling.removeEventListener(starling.events.Event.CONTEXT3D_CREATE, starling_context3DCreateHandler);
			this._starling.addEventListener(starling.events.Event.ROOT_CREATED, starling_rootCreatedHandler);
			this.nextFrame();

			this.initializeMixins();
			
			var theme:Object = this.createTheme();
			if(theme is IAsyncTheme)
			{
				var assetManagerTheme:IAsyncTheme = IAsyncTheme(theme);
				if(assetManagerTheme.isCompleteForStarling(this._starling))
				{
					this.setRootClass();
				}
				else
				{
					assetManagerTheme.addEventListener(starling.events.Event.COMPLETE, theme_completeHandler);
				}
			}
			else
			{
				this.setRootClass();
			}
		}

		/**
		 * @private
		 */
		protected function starling_rootCreatedHandler(event:starling.events.Event):void
		{
			this._starling.start();
		}

		/**
		 * @private
		 */
		protected function theme_completeHandler(event:starling.events.Event, starling:Starling):void
		{
			if(this._starling !== starling)
			{
				return;
			}
			this.setRootClass();
		}
	}
}
