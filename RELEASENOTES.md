# Feathers SDK Release Notes

Noteworthy changes in official, stable releases of the [Feathers SDK](http://feathersui.com/sdk).

## 2.3.0-beta

* When an `id` is set in MXML on a Feathers component, it may now be accessed as a property at runtime.
* The type of the `theme` property from `feathers.core.IApplication` is changed to `Class` instead of `String`. The value of this property is now accessible at runtime.
* `Application`, `StackScreenNavigatorApplication`, and `DrawersApplication` updated to set native window visible on startup in AIR because Flash Builder defaults to `false`. Flex changes visibility dynamically, so Feathers needs to do the same since we cannot change Flash Builder's behavior.
* `StarlingBootstrap` updated to support themes that require `AssetManager` to load textures and other assets.
* External files to be loaded by themes with `AssetManager` now included next to SWC files.
* Unit tests for both Feathers UI and Starling may be run with the `test` target in the Ant build script.

## 2.2.0

First stable version.