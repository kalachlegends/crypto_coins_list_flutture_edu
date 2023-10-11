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
    apiKey: 'AIzaSyDgg1jfUC8R5G1VF0EDcetcRtkcFWv2kZk',
    appId: '1:500058140528:web:c139de0af8f377581ae9b5',
    messagingSenderId: '500058140528',
    projectId: 'crypto-coins-list-ba48f',
    authDomain: 'crypto-coins-list-ba48f.firebaseapp.com',
    storageBucket: 'crypto-coins-list-ba48f.appspot.com',
    measurementId: 'G-4Q7LE8CKH7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1kArx2i1JzgZEt_4kBmxgttgdSb08Jio',
    appId: '1:500058140528:android:9bc4f36e9ca0776b1ae9b5',
    messagingSenderId: '500058140528',
    projectId: 'crypto-coins-list-ba48f',
    storageBucket: 'crypto-coins-list-ba48f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBITAm2UXbPyrHS1-7VJb9uhsEWDI-7NWk',
    appId: '1:500058140528:ios:3ad0d7804979235f1ae9b5',
    messagingSenderId: '500058140528',
    projectId: 'crypto-coins-list-ba48f',
    storageBucket: 'crypto-coins-list-ba48f.appspot.com',
    iosBundleId: 'com.cryptoguys.cryptoCoinsList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBITAm2UXbPyrHS1-7VJb9uhsEWDI-7NWk',
    appId: '1:500058140528:ios:ba34fddcd1ae53231ae9b5',
    messagingSenderId: '500058140528',
    projectId: 'crypto-coins-list-ba48f',
    storageBucket: 'crypto-coins-list-ba48f.appspot.com',
    iosBundleId: 'com.cryptoguys.cryptoCoinsList.RunnerTests',
  );
}
