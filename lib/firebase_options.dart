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
    apiKey: 'AIzaSyCn0nrA-QgyDqnbl0QaZXy3vH4eyFT5jKE',
    appId: '1:482864372442:web:41de7c5301faef6466e3e3',
    messagingSenderId: '482864372442',
    projectId: 'messanger-bcff7',
    authDomain: 'messanger-bcff7.firebaseapp.com',
    storageBucket: 'messanger-bcff7.appspot.com',
    measurementId: 'G-TLS4ZFPC6N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs57zAw52j-mZGc7tZJcZr5_Tm2tigFvc',
    appId: '1:482864372442:android:1c51ad533fa8d1c466e3e3',
    messagingSenderId: '482864372442',
    projectId: 'messanger-bcff7',
    storageBucket: 'messanger-bcff7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsXKe5D3chnKAe2HGlgh3qF6O1X_3Mwe4',
    appId: '1:482864372442:ios:c9e260fd2329920f66e3e3',
    messagingSenderId: '482864372442',
    projectId: 'messanger-bcff7',
    storageBucket: 'messanger-bcff7.appspot.com',
    iosClientId: '482864372442-ale6f6ci9ekeqp8ecjsdm508i9v3s07j.apps.googleusercontent.com',
    iosBundleId: 'com.example.mySimpleMessanger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsXKe5D3chnKAe2HGlgh3qF6O1X_3Mwe4',
    appId: '1:482864372442:ios:c9e260fd2329920f66e3e3',
    messagingSenderId: '482864372442',
    projectId: 'messanger-bcff7',
    storageBucket: 'messanger-bcff7.appspot.com',
    iosClientId: '482864372442-ale6f6ci9ekeqp8ecjsdm508i9v3s07j.apps.googleusercontent.com',
    iosBundleId: 'com.example.mySimpleMessanger',
  );
}
