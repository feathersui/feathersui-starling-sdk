/*
Feathers SDK
Copyright 2012-2015 Bowler Hat LLC

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
		function get theme():String;

		/**
		 * @private
		 */
		function set theme(value:String):void;
		
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
	}
}
