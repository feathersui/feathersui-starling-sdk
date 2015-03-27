package feathers.binding
{

	import feathers.binding.utils.IXMLNotifiable;
	import feathers.binding.utils.XMLNotifier;

	import mx.core.mx_internal;

	use namespace mx_internal;

	[ExcludeClass]

	/**
	 *  @private
	 */
	public class XMLWatcher extends Watcher implements IXMLNotifiable
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		/**
		 *  Constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function XMLWatcher(propertyName:String, listeners:Array)
		{
			super(listeners);

			_propertyName = propertyName;
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		/**
		 *  The parent object of this property.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		private var parentObj:Object;

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  propertyName
		//----------------------------------

		/**
		 *  Storage for the propertyName property.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		private var _propertyName:String;

		/**
		 *  The name of the property this Watcher is watching.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function get propertyName():String
		{
			return _propertyName;
		}

		//--------------------------------------------------------------------------
		//
		//  Overridden methods: Watcher
		//
		//--------------------------------------------------------------------------

		/**
		 *  If the parent has changed we need to update ourselves
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		override public function updateParent(parent:Object):void
		{
			if (parentObj && (parentObj is XML || parentObj is XMLList))
				XMLNotifier.getInstance().unwatchXML(parentObj, this);

			if (parent is Watcher)
				parentObj = parent.value;
			else
				parentObj = parent;

			if (parentObj && (parentObj is XML || parentObj is XMLList))
				XMLNotifier.getInstance().watchXML(parentObj, this);

			// Now get our property.
			wrapUpdate(updateProperty);
		}

		/**
		 *  @private
		 */
		override protected function shallowClone():Watcher
		{
			return new XMLWatcher(_propertyName, listeners);
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		/**
		 *  Gets the actual property then updates
		 *  the Watcher's children appropriately.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		private function updateProperty():void
		{
			if (parentObj)
			{
				if (_propertyName == "this")
					value = parentObj;
				else
					value = parentObj[_propertyName];
			}
			else
			{
				value = null;
			}

			updateChildren();
		}

		/**
		 *  @private
		 */
		public function xmlNotification(currentTarget:Object, type:String,
			target:Object, value:Object, detail:Object):void
		{
			updateProperty();

			notifyListeners(true);
		}
	}

}