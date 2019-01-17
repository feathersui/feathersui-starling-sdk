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
	/**
	 * Properties common to Feathers MXML applications.
	 */
	public interface IApplication
	{
		/**
		 * The fully-qualified class name of the application's theme, to be
		 * instantiated by Feathers once Starling has created its context, but
		 * before the application root class is created.
		 *
		 * <p>Must be set in MXML and cannot be set after initialization.</p>.
		 * 
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to instantiate
		 * the theme manually in your custom bootstrap class.</p>
		 */
		function get theme():Class;

		/**
		 * @private
		 */
		function set theme(value:Class):void;
		
		/**
		 * The profile used by Starling when creating its Context3D.
		 *
		 * <p>Must be set in MXML and cannot be set after initialization.</p>.
		 *
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to pass in
		 * the Context3D profile manually in your custom bootstrap class.</p>
		 * 
		 * @see http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display3D/Context3DProfile.html flash.display3D.Context3DProfile
		 */
		function get context3DProfile():String;

		/**
		 * @private
		 */
		function set context3DProfile(value:String):void;

		/**
		 * Indicates if another Starling instance (or another Stage3D framework
		 * altogether) uses the same render context.
		 *
		 * <p>Must be set in MXML and cannot be set after initialization.</p>.
		 *
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to set the
		 * shareContext property manually in your custom bootstrap class.</p>
		 *
		 * @see http://doc.starling-framework.org/current/starling/core/Starling.html#shareContext starling.core.Starling.shareContext
		 */
		function get shareContext():Boolean;

		/**
		 * @private
		 */
		function set shareContext(value:Boolean):void;

		/**
		 * When enabled, Starling will skip rendering the stage if it hasn't
		 * changed since the last frame.
		 * 
		 * <p>This property defaults to <code>true</code>, and it may need to
		 * be disabled if using video or render textures.</p>
		 *
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to set the
		 * skipUnchangedFrames property manually in your custom bootstrap class.</p>
		 *
		 * @see http://doc.starling-framework.org/current/starling/core/Starling.html#skipUnchangedFrames starling.core.Starling.skipUnchangedFrames
		 */
		function get skipUnchangedFrames():Boolean;

		/**
		 * @private
		 */
		function set skipUnchangedFrames(value:Boolean):void;

		/**
		 * Indicates if a small statistics box (with FPS, memory usage and draw
		 * count) is displayed.
		 *
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to set the
		 * showStats property manually in your custom bootstrap class.</p>
		 *
		 * @see http://doc.starling-framework.org/current/starling/core/Starling.html#showStats starling.core.Starling.showStats
		 */
		function get showStats():Boolean;

		/**
		 * @private
		 */
		function set showStats(value:Boolean):void;

		/**
		 * The anti-aliasing level. 0 - none, 16 - maximum.
		 *
		 * <p>Warning: When using <a href="http://feathersui.com/help/sdk/custom-starling-initialization.html">
		 * <code>[Frame]</code> metadata</a> to customize the initialization of
		 * Starling, this property will be ignored. You will need to set the
		 * antiAliasing property manually in your custom bootstrap class.</p>
		 *
		 * @see http://doc.starling-framework.org/current/starling/core/Starling.html#antiAliasing starling.core.Starling.antiAliasing
		 */
		function get antiAliasing():int;

		/**
		 * @private
		 */
		function set antiAliasing(value:int):void;
	}
}
