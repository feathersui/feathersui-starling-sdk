/*
Feathers
Copyright 2012-2015 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.utils.mxml
{
	/**
	 * Creates a sub-component factory from an instance defined in an
	 * &lt;fx:Declarations&gt; element. May be used as an alternative to
	 * &lt;fx:Component&gt; to avoid requiring <code>outerDocument</code> to
	 * access ActionScript code, but only if one instance is required.
	 * 
	 * <p>In the following example, an instance of a <code>Header</code>
	 * component is passed to the <code>headerFactory</code> property of a
	 * <code>Panel</code> component using <code>factoryFromInstance()</code>.</p> 
	 *
	 * <listing version="3.0">
	 * &lt;f:Panel xmlns:fx="http://ns.adobe.com/mxml/2009"
	 * 	xmlns:f="library://ns.feathersui.com/mxml"
	 * 	headerFactory="{factoryFromInstance(customHeader)}"&gt;
	 * 	&lt;fx:Declarations&gt;
	 * 		&lt;f:Header id="customHeader"&gt;
	 * 			&lt;f:leftItems&gt;
	 * 				&lt;fx:Vector type="starling.display.DisplayObject"&gt;
	 * 					&lt;f:Button label="Back"/&gt;
	 * 				&lt;/fx:Vector&gt;
	 * 			&lt;/f:leftItems&gt;
	 * 		&lt;/f:Header&gt;
	 * 	&lt;/fx:Declarations&gt;
	 * &lt;/f:Panel&gt;</listing>
	 */
	public function factoryFromInstance(instance:*):Function
	{
		return function():* { return instance; };
	}
}
