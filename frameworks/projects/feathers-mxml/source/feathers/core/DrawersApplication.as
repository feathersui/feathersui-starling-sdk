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
	import feathers.controls.Drawers;
	import feathers.utils.display.stageToStarling;

	import flash.display.Stage;
	import flash.errors.IllegalOperationError;

	import starling.core.Starling;
	import starling.events.Event;

	[Frame(factoryClass="feathers.core.StarlingBootstrap")]
	
	/**
	 * Base class for a Feathers application with a
	 * <code>Drawers</code> as the root display object.
	 */
	public class DrawersApplication extends Drawers implements IApplication
	{
		/**
		 * Constructor.
		 */
		public function DrawersApplication()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, application_addedToStageHandler);
		}

		/**
		 * @private
		 */
		protected var _theme:Class;

		/**
		 * @copy feathers.core.IApplication#theme
		 */
		public function get theme():Class
		{
			return this._theme;
		}

		/**
		 * @private
		 */
		public function set theme(value:Class):void
		{
			if(this._isInitialized)
			{
				throw new IllegalOperationError("theme can only be set in MXML before an application has initialized.");
			}
			this._theme = value;
		}

		/**
		 * @private
		 */
		protected var _context3DProfile:String;

		[Inspectable(type="String",enumeration="auto,baselineConstrained,baseline,baselineExtended,standardConstrained,standard,standardExtended,enhanced")]
		/**
		 * @copy feathers.core.IApplication#context3DProfile
		 */
		public function get context3DProfile():String
		{
			if(this._context3DProfile !== null)
			{
				return this._context3DProfile;
			}
			return Starling.current.profile;
		}

		/**
		 * @private
		 */
		public function set context3DProfile(value:String):void
		{
			if(this._isInitialized)
			{
				throw new IllegalOperationError("context3DProfile can only be set before an application has initialized.");
			}
			this._context3DProfile = value;
		}

		/**
		 * @private
		 */
		protected var _shareContext:Boolean = false;

		/**
		 * @copy feathers.core.IApplication#shareContext
		 */
		public function get shareContext():Boolean
		{
			return this._shareContext;
		}

		/**
		 * @private
		 */
		public function set shareContext(value:Boolean):void
		{
			if(this._isInitialized)
			{
				throw new IllegalOperationError("shareContext can only be set in MXML before an application has initialized.");
			}
			this._shareContext = value;
		}

		/**
		 * @private
		 */
		protected var _skipUnchangedFrames:Boolean = true;

		/**
		 * @copy feathers.core.IApplication#skipUnchangedFrames
		 */
		public function get skipUnchangedFrames():Boolean
		{
			return this._skipUnchangedFrames;
		}

		/**
		 * @private
		 */
		public function set skipUnchangedFrames(value:Boolean):void
		{
			this._skipUnchangedFrames = value;
			var starling:Starling = stageToStarling(this.stage);
			if(starling !== null)
			{
				starling.skipUnchangedFrames = value;
			}
		}

		/**
		 * @private
		 */
		protected var _showStats:Boolean = false;

		/**
		 * @copy feathers.core.IApplication#showStats
		 */
		public function get showStats():Boolean
		{
			return this._showStats;
		}

		/**
		 * @private
		 */
		public function set showStats(value:Boolean):void
		{
			this._showStats = value;
			var starling:Starling = stageToStarling(this.stage);
			if(starling !== null)
			{
				starling.showStats = value;
			}
		}

		/**
		 * @private
		 */
		protected var _antiAliasing:int = 0;

		/**
		 * @copy feathers.core.IApplication#antiAliasing
		 */
		public function get antiAliasing():int
		{
			return this._antiAliasing;
		}

		/**
		 * @private
		 */
		public function set antiAliasing(value:int):void
		{
			if(this._isInitialized)
			{
				throw new IllegalOperationError("antiAliasing can only be set in MXML before an application has initialized.");
			}
			this._antiAliasing = value;
		}

		/**
		 * @private
		 */
		protected function application_addedToStageHandler(event:Event):void
		{
			//Flash Builder sets the visible element in the AIR application
			//descriptor to false for Flex projects. Flex dynamically sets it to
			//true, so we need to do the same.
			var starling:Starling = stageToStarling(this.stage);
			var nativeStage:Stage = starling.nativeStage;
			if("nativeWindow" in nativeStage)
			{
				var nativeWindow:Object = nativeStage["nativeWindow"];
				if(nativeWindow)
				{
					nativeWindow.visible = true;
				}
			}
		}
	}
}
