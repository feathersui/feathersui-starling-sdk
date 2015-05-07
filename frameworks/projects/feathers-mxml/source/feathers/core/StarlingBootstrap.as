/*
Feathers Enterprise SDK
Copyright 2012-2015 Joshua Tynjala. All Rights Reserved.

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
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;

	import starling.core.Starling;
	import starling.display.Stage;
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
				//pick some reasonable defaults
				if(SystemUtil.isDesktop)
				{
					//on desktop, the safest option is baselineConstrained,
					//due to old GPUs.
					context3DProfile = Context3DProfile.BASELINE_CONSTRAINED;
				}
				else
				{
					//on mobile, it's safe to choose baseline
					context3DProfile = Context3DProfile.BASELINE;
				}
			}
			var starling:Starling = new Starling(null, this.stage, null, null, Context3DRenderMode.AUTO, context3DProfile);
			starling.supportHighResolutions = this.stage.contentsScaleFactor > 1;
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
			this.stage.addEventListener(flash.events.Event.RESIZE, stage_resizeHandler, false, 0, true);
		}

		/**
		 * @private
		 */
		protected function loaderInfo_completeHandler(event:flash.events.Event):void
		{
			this._starling = this.createStarling();
			this.setupScaling();
			this._starling.addEventListener(starling.events.Event.CONTEXT3D_CREATE, starling_context3DCreateHandler);
		}

		/**
		 * @private
		 */
		protected function starling_context3DCreateHandler(event:starling.events.Event):void
		{
			this._starling.removeEventListener(starling.events.Event.CONTEXT3D_CREATE, starling_context3DCreateHandler);
			this._starling.addEventListener(starling.events.Event.ROOT_CREATED, starling_rootCreatedHandler);
			this.nextFrame();
			var theme:Object = this.createTheme();
			this.setRootClass();
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
		protected function stage_resizeHandler(event:flash.events.Event):void
		{
			var stageWidth:Number = this.stage.stageWidth;
			var stageHeight:Number = this.stage.stageHeight;
			var starlingStage:Stage = this._starling.stage;
			starlingStage.stageWidth = stageWidth;
			starlingStage.stageHeight = stageHeight;
			
			var viewPort:Rectangle = this._starling.viewPort;
			viewPort.width = stageWidth;
			viewPort.height = stageHeight;
		}
	}
}
