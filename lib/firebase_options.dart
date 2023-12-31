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
    apiKey: 'AIzaSyC4xQTqMF_fq4fNTHrTJloPqrY-XkmeWio',
    appId: '1:811200932721:web:d4c59db201b143561be4d0',
    messagingSenderId: '811200932721',
    projectId: 'poupaai-a8b1c',
    authDomain: 'poupaai-a8b1c.firebaseapp.com',
    storageBucket: 'poupaai-a8b1c.appspot.com',
    measurementId: 'G-TFD27FYEXP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7qYIZJp_I7Y5nUX6pZSdZUlsEq_d8wf0',
    appId: '1:811200932721:android:b91999d76bd11e111be4d0',
    messagingSenderId: '811200932721',
    projectId: 'poupaai-a8b1c',
    storageBucket: 'poupaai-a8b1c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8IFL6vOgGm6WC-fz7X_u6wrbHZsoHRE4',
    appId: '1:811200932721:ios:4681784b1a7cdf111be4d0',
    messagingSenderId: '811200932721',
    projectId: 'poupaai-a8b1c',
    storageBucket: 'poupaai-a8b1c.appspot.com',
    iosBundleId: 'com.example.poupaai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8IFL6vOgGm6WC-fz7X_u6wrbHZsoHRE4',
    appId: '1:811200932721:ios:8635fc1720b3e6af1be4d0',
    messagingSenderId: '811200932721',
    projectId: 'poupaai-a8b1c',
    storageBucket: 'poupaai-a8b1c.appspot.com',
    iosBundleId: 'com.example.poupaai.RunnerTests',
  );
}
