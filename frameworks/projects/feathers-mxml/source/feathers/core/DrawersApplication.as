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
	import feathers.controls.Drawers;

	import flash.errors.IllegalOperationError;

	import starling.core.Starling;

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
		}

		/**
		 * @private
		 */
		protected var _context3DProfile:String;

		[Inspectable(type="String",enumeration="baselineConstrained,baseline,baselineExtended,standardConstrained,standard,standardExtended")]
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
	}
}
