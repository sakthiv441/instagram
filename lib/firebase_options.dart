// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC6cduP3sX1eOPchXNtiRjzJEAs5jJZ1CY',
    appId: '1:454104189861:web:a74d7b29fc595fbb71364c',
    messagingSenderId: '454104189861',
    projectId: 'newinsta-f41a1',
    authDomain: 'newinsta-f41a1.firebaseapp.com',
    storageBucket: 'newinsta-f41a1.appspot.com',
    measurementId: 'G-XNNBGD8XLB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4TQFeNEYWe8SHi0KbcDirLQYiQE5Oep8',
    appId: '1:454104189861:android:7cb4ea4d5661f00b71364c',
    messagingSenderId: '454104189861',
    projectId: 'newinsta-f41a1',
    storageBucket: 'newinsta-f41a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACl-US4wi-VdQOAycdg3Mf5m5qlSLWNlU',
    appId: '1:454104189861:ios:bc4d408fd3b2ff9b71364c',
    messagingSenderId: '454104189861',
    projectId: 'newinsta-f41a1',
    storageBucket: 'newinsta-f41a1.appspot.com',
    iosClientId: '454104189861-1rv9rh0tqmkv8elv15u2tq9lmpiqel80.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACl-US4wi-VdQOAycdg3Mf5m5qlSLWNlU',
    appId: '1:454104189861:ios:bc4d408fd3b2ff9b71364c',
    messagingSenderId: '454104189861',
    projectId: 'newinsta-f41a1',
    storageBucket: 'newinsta-f41a1.appspot.com',
    iosClientId: '454104189861-1rv9rh0tqmkv8elv15u2tq9lmpiqel80.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram',
  );
}
