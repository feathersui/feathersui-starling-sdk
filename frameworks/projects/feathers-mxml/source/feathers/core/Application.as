/*
Feathers
Copyright 2012-2015 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.core
{
	import feathers.controls.LayoutGroup;

	[Frame(factoryClass="feathers.core.StarlingBootstrap")]

	/**
	 * Base class for a Feathers application.
	 */
	public class Application extends LayoutGroup
	{
		public function Application()
		{
			super();
			this.autoSizeMode = LayoutGroup.AUTO_SIZE_MODE_STAGE;
		}
	}
}
