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
