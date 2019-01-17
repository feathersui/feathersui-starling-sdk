# Feathers SDK Release Notes

Noteworthy changes in official, stable releases of the [Feathers SDK](https://feathersui.com/sdk).

## 4.0.0 - January 2019

* IApplication: interface exposes `antiAliasing` property to be set in MXML.
* StarlingBootstrap: If `context3DProfile` is not set, now defaults to "auto".

## 3.5.0 - June 2018

* MXML States: LayoutGroup, ScrollContainer, Panel, and other containers now support states syntax in MXML.

## 3.4.0 - December 2017

* Improved errors and visibility for Apache Flex compiler options that aren't relevant to Feathers, including -services, -preloader, -context-root, and -framework.

## 3.3.1 - October 2017

* Bug fixes from Feathers UI 3.3.1.

## 3.3.0 - July 2017

* Added configuration file for Visual Studio Code to ide/vscode-nextgenas. This configuration file ensures that the code intelligence understands that different classes are automatically imported in MXML files when using the Feathers SDK.
* Compiler: fixed issue where initializing member variable/constant that is [Deprecated] incorrectly throws extra warning.
* `flash.text.*` is not a default import in MXML because its classes conflict with `starling.text.*`.
* StarlingBootstrap: No longer passes null to init() static method on classes that use [Mixin] metadata. Classes that expect an IFlexModuleFactory will now throw a runtime error, but classes that expect non-null values will now work. Change parameter type to Object instead of IFlexModuleFactory if the class should work with both the Flex SDK and the Feathers SDK.

## 3.2.0 - April 2017

* New MXML Example: PullToRefresh
* feathers.skins.ImageSkin and starling.text.TextFormat may be used in MXML.

## 3.1.2 - January 2017

* Bug fixes from Feathers UI 3.1.2.

## 3.1.1 - November 2016

* Added support for AIR SDK packaged as DMG file to installer script.
* Bug fixes from Feathers UI 3.1.1.

## 3.1.0 - October 2016

* New Component: TabNavigatorApplication may be used to provide a top-level application with tabs, based on the TabNavigator component.
* New MXML Example: Tabs
* New MXML Example: Magic8Chat

## 3.0.4 - September 2016

* Bug fixes from Feathers UI 3.0.4.

## 3.0.3 - July 2016

* Bug fixes from Feathers UI 3.0.3.

## 3.0.2 - June 2016

* `StarlingBootstrap` pauses rendering on mobile when the app deactivates, and starts again on activate.
* Bug fixes from Feathers UI 3.0.2.

## 3.0.1 - June 2016

* Bug fixes from Feathers UI 3.0.1.

## 3.0.0 - June 2016

* Fixed issue where `[Bindable]` metadata without an event caused a compiler error in library projects.
* `StarlingBootstrap` sets static `Starling.multitouchEnabled` to `true` by default.
* `StarlingBootstrap` sets `skipUnchangedFrames` on its `Starling` instance to `true` by default.
* `StarlingBootstrap` now scales using `ScreenDensityScaleFactorManager`.
* `IApplication` interface exposes `shareContext`, `showStats`, and `skipUnchangedFrames` properties to be set in MXML.
* `IApplication`: `auto` included in available values for `context3DProfile` in MXML.
* Includes a few examples in the `examples` directory.

## 2.3.0 - December 2015

* When an `id` is set in MXML on a Feathers component, it may now be accessed as a property at runtime.
* The type of the `theme` property from `feathers.core.IApplication` is changed to `Class` instead of `String`. The value of this property is now accessible at runtime.
* `Application`, `StackScreenNavigatorApplication`, and `DrawersApplication` updated to set native window visible on startup in AIR because Flash Builder defaults to `false`. Flex changes visibility dynamically, so Feathers needs to do the same since we cannot change Flash Builder's behavior.
* `StarlingBootstrap` updated to support themes that require `AssetManager` to load textures and other assets.
* External files to be loaded by themes with `AssetManager` now included next to SWC files.
* Unit tests for both Feathers UI and Starling may be run with the `test` target in the Ant build script.

## 2.2.0 - August 2015

First stable version.