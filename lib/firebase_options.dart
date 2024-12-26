// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC7yqVB8zFsJlYpJG6eFzh_qFUrpr_6td0',
    appId: '1:459576423903:web:6389c644abccb9b2f0006a',
    messagingSenderId: '459576423903',
    projectId: 'chatify-128a8',
    authDomain: 'chatify-128a8.firebaseapp.com',
    storageBucket: 'chatify-128a8.firebasestorage.app',
    measurementId: 'G-4LE23KWGYR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxNsqDG2vTeq4SP6ilXXYsKTjACRNgh9w',
    appId: '1:459576423903:android:b34310be576c7cd4f0006a',
    messagingSenderId: '459576423903',
    projectId: 'chatify-128a8',
    storageBucket: 'chatify-128a8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEibLgQYVDintChtSiRzguCdU2LpmIjBk',
    appId: '1:459576423903:ios:8153ae9f678c4b6ef0006a',
    messagingSenderId: '459576423903',
    projectId: 'chatify-128a8',
    storageBucket: 'chatify-128a8.firebasestorage.app',
    iosBundleId: 'com.example.chatApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEibLgQYVDintChtSiRzguCdU2LpmIjBk',
    appId: '1:459576423903:ios:8153ae9f678c4b6ef0006a',
    messagingSenderId: '459576423903',
    projectId: 'chatify-128a8',
    storageBucket: 'chatify-128a8.firebasestorage.app',
    iosBundleId: 'com.example.chatApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7yqVB8zFsJlYpJG6eFzh_qFUrpr_6td0',
    appId: '1:459576423903:web:b73ed29a9b37e72af0006a',
    messagingSenderId: '459576423903',
    projectId: 'chatify-128a8',
    authDomain: 'chatify-128a8.firebaseapp.com',
    storageBucket: 'chatify-128a8.firebasestorage.app',
    measurementId: 'G-L2XKSNL0VT',
  );

}