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
    apiKey: 'AIzaSyBhw0DxXmyaik1-3vYtpPVFUExzy-HKDOo',
    appId: '1:581632559212:web:1b36ed2f3f239863803049',
    messagingSenderId: '581632559212',
    projectId: 'rakna-ea203',
    authDomain: 'rakna-ea203.firebaseapp.com',
    databaseURL: 'https://rakna-ea203-default-rtdb.firebaseio.com',
    storageBucket: 'rakna-ea203.appspot.com',
    measurementId: 'G-0KC1G51467',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnQ_fXaI2WxwOwGs7ZTsxWHzUgm6EfDow',
    appId: '1:581632559212:android:c12f935cbebfef20803049',
    messagingSenderId: '581632559212',
    projectId: 'rakna-ea203',
    databaseURL: 'https://rakna-ea203-default-rtdb.firebaseio.com',
    storageBucket: 'rakna-ea203.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQ59fFo-oGN27rJjKVt6FYbQ7Vg47QpmY',
    appId: '1:581632559212:ios:394634407d8f6f34803049',
    messagingSenderId: '581632559212',
    projectId: 'rakna-ea203',
    databaseURL: 'https://rakna-ea203-default-rtdb.firebaseio.com',
    storageBucket: 'rakna-ea203.appspot.com',
    androidClientId: '581632559212-kg6a48gv9o1tenmiaut18c41anh6vljr.apps.googleusercontent.com',
    iosClientId: '581632559212-msjiuakqi0qgao34e6eag994j1ebqsn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.raknaGraduationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQ59fFo-oGN27rJjKVt6FYbQ7Vg47QpmY',
    appId: '1:581632559212:ios:1c9222214f608a9b803049',
    messagingSenderId: '581632559212',
    projectId: 'rakna-ea203',
    databaseURL: 'https://rakna-ea203-default-rtdb.firebaseio.com',
    storageBucket: 'rakna-ea203.appspot.com',
    androidClientId: '581632559212-kg6a48gv9o1tenmiaut18c41anh6vljr.apps.googleusercontent.com',
    iosClientId: '581632559212-44m6p4r7hv4kgei5ftasqgmsq4avoebn.apps.googleusercontent.com',
    iosBundleId: 'com.example.raknaGraduationProject.RunnerTests',
  );
}
