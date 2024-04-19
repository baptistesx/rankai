<p align="center">
    <a href="https://www.rankai.com/">
        <img width="200px" src=".github/images/rankai_logo.png" alt="RankAI logo" />
    </a>
    <br/>
    <br/>
    <a href="https://flutter.dev/docs/get-started/install">
        <img src="https://img.shields.io/badge/dart%20version-3.2.0-green.svg?style=flat-square" alt="Dart 3.2.0" />
    </a>
    <a href="https://flutter.dev/docs/get-started/install">
        <img src="https://img.shields.io/badge/flutter%20version-3.16.0-green.svg?style=flat-square" alt="Flutter 3.16.0" />
    </a>
</p>

This project is develop in Flutter 3.19.4.

# Flutter commands

Generate models

```shell script
dart run build_runner build --delete-conflicting-outputs
```

Run app on specific environment:

```shell script
flutter run --flavor dev --dart-define-from-file assets/config/dev.json

flutter run --flavor preprod --dart-define-from-file assets/config/preprod.json

flutter run --flavor prod --dart-define-from-file assets/config/prod.json
```

# Firebase

### To add new [Firebase plugin](https://firebase.flutter.dev/):

- Install [Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli)
- Login to firebase

```shell script
firebase login
```

- Install the FlutterFire CLI by running the following command from any directory:

```shell script
dart pub global activate flutterfire_cli
```

- From your Flutter project directory, run the following command:

```shell script
flutter pub add <PLUGIN_NAME>
```

- From your Flutter project directory, run the following commands:

**Dev**

```shell script
./setup_firebase_flavors.sh dev
```

**PreProd**

```shell script
./setup_firebase_flavors.sh preprod
```

**Prod**

```shell script
./setup_firebase_flavors.sh prod
```
