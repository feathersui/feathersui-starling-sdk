/*
Feathers
Copyright 2012-2015 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
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
	import starling.events.Event;

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
			return {};
		}

		/**
		 * @private
		 */
		protected function createStarling(rootClass:Class = null):Starling
		{
			return new Starling(null, this.stage, null, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE_CONSTRAINED);
		}

		/**
		 * @private
		 */
		protected function createTheme():Object
		{
			var themeClassName:String = info()["themeClassName"];
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
			var rootClassName:String = info()["rootClassName"];
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
