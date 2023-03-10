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
    apiKey: 'AIzaSyDnjX1teLUnCXmqBHFUP5aYkGvI-aYS2LE',
    appId: '1:230860481840:web:abb4812ea612bf948954f5',
    messagingSenderId: '230860481840',
    projectId: 'homezy-4838c',
    authDomain: 'homezy-4838c.firebaseapp.com',
    storageBucket: 'homezy-4838c.appspot.com',
    measurementId: 'G-KPPXWE4PE8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTHVCUS7VglevNlkF9ivw5yNLXdYECzdE',
    appId: '1:230860481840:android:8e8c821d4e29f85c8954f5',
    messagingSenderId: '230860481840',
    projectId: 'homezy-4838c',
    storageBucket: 'homezy-4838c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPHSIT8cucyt6oTwVCa1hv1d-0UMJx8Eo',
    appId: '1:230860481840:ios:d4c78929eb29bdbc8954f5',
    messagingSenderId: '230860481840',
    projectId: 'homezy-4838c',
    storageBucket: 'homezy-4838c.appspot.com',
    iosClientId: '230860481840-fbq5fhni39ot6k964kotmjhrp817fkul.apps.googleusercontent.com',
    iosBundleId: 'com.example.homezy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPHSIT8cucyt6oTwVCa1hv1d-0UMJx8Eo',
    appId: '1:230860481840:ios:d4c78929eb29bdbc8954f5',
    messagingSenderId: '230860481840',
    projectId: 'homezy-4838c',
    storageBucket: 'homezy-4838c.appspot.com',
    iosClientId: '230860481840-fbq5fhni39ot6k964kotmjhrp817fkul.apps.googleusercontent.com',
    iosBundleId: 'com.example.homezy',
  );
}
