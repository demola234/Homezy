import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homezy/core/services/push_notification/local_notification.dart';
import 'package:homezy/core/services/push_notification/notification_service.dart';
import 'package:homezy/firebase_options.dart';
import 'package:homezy/locator.dart';
import 'package:homezy/app/app.dart';

//*  THIS handles the background notification
Future<void> _backgroundNotificationHandler(RemoteMessage remoteMsg) async {
  if (remoteMsg.notification != null) {
    await LocalNotificationService.instance
        .showNotificationOnForeGround(remoteMsg);
    debugPrint('Background Notification: ');
    debugPrint('Title: ${remoteMsg.notification?.title}');
    debugPrint('Body: ${remoteMsg.notification?.body}');
  }
}

void main() async {
  runZonedGuarded<Future<void>>(() async {
    //* Remove native splash screen
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
    //* Initialize firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //* Initialize firebase messaging
    await FirebaseMessaging.instance.getInitialMessage();
    //*
    FirebaseMessaging.onBackgroundMessage(_backgroundNotificationHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('onMessage: ${message.messageId}');
    });
    await NotificationService.instance.getPermission();

    await LocalNotificationService.instance.initialize();

    NotificationService.instance
      ..handleForegroundNotification()
      ..handleBackgroundNotification();

    await NotificationService.instance
        .handleNotificationOpenedWhenAppIsTerminated();

    await LocalNotificationService.instance.initialize();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //* Force crash for testing
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    //* Initialize DI : Dependency Injection
    await injector();
    await GetStorage.init();

    //* Initialize Riverpod ProviderScope
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
