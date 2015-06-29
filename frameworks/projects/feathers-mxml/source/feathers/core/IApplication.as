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
		 * The profile used by Starling when creating its Context3D.
		 *
		 * <p>Must be set in MXML and cannot be set after initialization.</p>.
		 */
		function get context3DProfile():String;

		/**
		 * @private
		 */
		function set context3DProfile(value:String):void;
	}
}
