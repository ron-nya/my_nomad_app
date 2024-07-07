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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDsVbCXCgaskD3r7H7cvFjkj1HiyaX2mFw',
    appId: '1:953828657324:web:1f6abe48eb80e07a0d3709',
    messagingSenderId: '953828657324',
    projectId: 'my-nomad-app01',
    authDomain: 'my-nomad-app01.firebaseapp.com',
    storageBucket: 'my-nomad-app01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYvM_qK3d2-9j0kTCxIrPInTDwrJbFba4',
    appId: '1:953828657324:android:1a4403cbc0aa21f40d3709',
    messagingSenderId: '953828657324',
    projectId: 'my-nomad-app01',
    storageBucket: 'my-nomad-app01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZ2RUZ9yHXV71R1ctazOs_FzDFmSbAqPk',
    appId: '1:953828657324:ios:e83fee0caac981300d3709',
    messagingSenderId: '953828657324',
    projectId: 'my-nomad-app01',
    storageBucket: 'my-nomad-app01.appspot.com',
    iosBundleId: 'com.example.myApp',
  );
}
