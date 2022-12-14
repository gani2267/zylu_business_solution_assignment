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
    apiKey: 'AIzaSyCKBDLopmCy78EhWKG-FFFknDFpIq8N3-U',
    appId: '1:1046375499406:web:7dce42e4c5edf1021fabdf',
    messagingSenderId: '1046375499406',
    projectId: 'assignment-3215e',
    authDomain: 'assignment-3215e.firebaseapp.com',
    storageBucket: 'assignment-3215e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOhgwJJeuBOmxZTHwtKAIqpAjQtnX_a7c',
    appId: '1:1046375499406:android:bbfecd95451c5ad01fabdf',
    messagingSenderId: '1046375499406',
    projectId: 'assignment-3215e',
    storageBucket: 'assignment-3215e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANCgB9s5y4q4-INi5t9ZqGdXegjV62dTo',
    appId: '1:1046375499406:ios:a4c23c09e3ed54351fabdf',
    messagingSenderId: '1046375499406',
    projectId: 'assignment-3215e',
    storageBucket: 'assignment-3215e.appspot.com',
    iosClientId: '1046375499406-4oi638b2i5ek25ni3tbpbuqeij82dfva.apps.googleusercontent.com',
    iosBundleId: 'com.example.zyluBusinessSolutionAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANCgB9s5y4q4-INi5t9ZqGdXegjV62dTo',
    appId: '1:1046375499406:ios:a4c23c09e3ed54351fabdf',
    messagingSenderId: '1046375499406',
    projectId: 'assignment-3215e',
    storageBucket: 'assignment-3215e.appspot.com',
    iosClientId: '1046375499406-4oi638b2i5ek25ni3tbpbuqeij82dfva.apps.googleusercontent.com',
    iosBundleId: 'com.example.zyluBusinessSolutionAssignment',
  );
}
