# Music App

An offline Music Player project created in flutter using provider.

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## Features:

* Splash
* Home
* Routing
* Local Database
* Provider (State Management)
* background play
* Multi Theme Support

### Libraries & Tools Used

* [Local Database](https://pub.dev/packages/hive)
* [Provider](https://pub.dev/packages/provider) (State Management)
* [Data fetching](https://pub.dev/packages/on_audio_query)
* [Background play](https://pub.dev/packages/just_audio_background) //check this pkg for changes in androigmanifest.xml
* [play conrolls](https://pub.dev/packages/just_audio)
* [icon](https://pub.dev/packages/flutter_launcher_icons)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- constants/
|- data/
|- stores/
|- ui/
|- utils/
|- widgets/
|- main.dart
|- routes.dart
```


