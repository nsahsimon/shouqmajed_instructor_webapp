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
    apiKey: 'AIzaSyCLdrAa25MJedj70O-3nLbSNAruynmKZio',
    appId: '1:46059946446:web:412a4f7a6d8c725b49eb9f',
    messagingSenderId: '46059946446',
    projectId: 'bahrain-student-app',
    authDomain: 'bahrain-student-app.firebaseapp.com',
    storageBucket: 'bahrain-student-app.appspot.com',
    measurementId: 'G-SQXZK0F47J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCH5oA5y5Fxl1W7fXWMX4sL8agyvUOOROw',
    appId: '1:46059946446:android:4a1ab0aeaea7ee3f49eb9f',
    messagingSenderId: '46059946446',
    projectId: 'bahrain-student-app',
    storageBucket: 'bahrain-student-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVCMFZzofpATECEdZ3quydqAUNAwCqqdw',
    appId: '1:46059946446:ios:66d1b472134a9fb849eb9f',
    messagingSenderId: '46059946446',
    projectId: 'bahrain-student-app',
    storageBucket: 'bahrain-student-app.appspot.com',
    iosClientId: '46059946446-o5mnvk97ch5iee58m14j9g5qhhte0ej9.apps.googleusercontent.com',
    iosBundleId: 'com.example.instructor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVCMFZzofpATECEdZ3quydqAUNAwCqqdw',
    appId: '1:46059946446:ios:66d1b472134a9fb849eb9f',
    messagingSenderId: '46059946446',
    projectId: 'bahrain-student-app',
    storageBucket: 'bahrain-student-app.appspot.com',
    iosClientId: '46059946446-o5mnvk97ch5iee58m14j9g5qhhte0ej9.apps.googleusercontent.com',
    iosBundleId: 'com.example.instructor',
  );
}
