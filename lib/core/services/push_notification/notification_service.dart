import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:homezy/core/global/error/failure.dart';
import 'package:homezy/core/services/push_notification/local_notification.dart';
// import 'package:homezy/core/services/push_notification/notification_failure.dart';


class NotificationService {
  final FirebaseMessaging _firebaseMessaging;

  const NotificationService._internal({
    required FirebaseMessaging firebaseMessaging,
  }) : _firebaseMessaging = firebaseMessaging;

  factory NotificationService._initialize() => NotificationService._internal(
        firebaseMessaging: FirebaseMessaging.instance,
      );

  static final NotificationService instance = NotificationService._initialize();

  Future<Either<Failure, Unit>> getPermission() async {
    try {
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        return const Right(unit);
      } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return  Left(AccessDenied());
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.notDetermined) {
        return  Left(AccessDenied());
      }
    } catch (e) {
      return Left(NotificationFailure());
    }
    return  Left(NotificationFailure());
  }

  void handleForegroundNotification() {
    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        await LocalNotificationService.instance
            .showNotificationOnForeGround(message);
        final title = message.notification!.title;
        final body = message.notification!.body;
        debugPrint('Message also contained a notification: ${message.notification}');
        debugPrint(title);
        debugPrint(body);
      }
    });
  }

  void handleBackgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen((eventMsg) {
      final title = eventMsg.notification!.title;
      final body = eventMsg.notification!.body;
      debugPrint(
          'Message also contained a notification: ${eventMsg.notification}');
      debugPrint(title);
      debugPrint(body);
    });
  }

  Future<Either<Failure, Unit>>
      handleNotificationOpenedWhenAppIsTerminated() async {
    return await FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        final title = value.notification!.title;
        final body = value.notification!.body;
        debugPrint('Message also contained a notification: ${value.notification}');
        debugPrint(title);
        debugPrint(body);
        return const Right(unit);
      }
      return  Left(NotificationFailure());
    });
  }
}
