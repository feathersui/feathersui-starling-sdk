////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package
{

/**
 *  @private
 *  This class is used to link additional classes into framework.swc
 *  beyond those that are found by dependecy analysis starting
 *  from the classes specified in manifest.xml.
 *  For example, Button does not have a reference to ButtonSkin,
 *  but ButtonSkin needs to be in framework.swc along with Button.
 */
internal class FrameworkClasses
{
	//core classes
	import mx.core.BitmapAsset; BitmapAsset;
	import mx.core.ByteArrayAsset; ByteArrayAsset;
	import mx.core.ButtonAsset; ButtonAsset;
    import mx.core.DebuggableWorker; DebuggableWorker;
	import mx.core.FontAsset; FontAsset;
	import mx.core.FlexLoader; FlexLoader;
	import mx.core.IFlexModule; IFlexModule;
	import mx.core.MovieClipAsset; MovieClipAsset;
	import mx.core.MovieClipLoaderAsset; MovieClipLoaderAsset;
	import mx.core.SimpleApplication; SimpleApplication;
	import mx.core.SoundAsset; SoundAsset;
	import mx.core.SpriteAsset; SpriteAsset;
	import mx.core.TextFieldAsset; TextFieldAsset;
	import mx.events.ModuleEvent; ModuleEvent;
	import mx.modules.IModuleInfo; IModuleInfo;
	import mx.modules.ModuleBase; ModuleBase;
	import mx.modules.ModuleManager; ModuleManager;
	import mx.resources.IResourceBundle; IResourceBundle;
	import mx.resources.IResourceManager; IResourceManager;
	import mx.resources.IResourceModule; IResourceModule;
	import mx.resources.Locale; Locale;
	import mx.resources.ResourceBundle; ResourceBundle;
	import mx.resources.ResourceManager; ResourceManager;

    //framework classes
    import mx.core.ClassFactory; ClassFactory;
    import mx.core.DeferredInstanceFromClass; DeferredInstanceFromClass;
    import mx.core.DeferredInstanceFromFunction; DeferredInstanceFromFunction;
    import mx.core.IDeferredInstance; IDeferredInstance;
    import mx.core.IFactory; IFactory;
    import mx.core.IPropertyChangeNotifier; IPropertyChangeNotifier;
    import mx.core.mx_internal; mx_internal;
	import mx.events.PropertyChangeEvent; PropertyChangeEvent;
}

}

