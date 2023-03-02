// ignore_for_file: avoid_debugPrint

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:homezy/core/global/error/failure.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  const LocalNotificationService._internal({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  factory LocalNotificationService._initialize() =>
      LocalNotificationService._internal(
        flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
      );

  static final LocalNotificationService instance =
      LocalNotificationService._initialize();

  Future<Either<Failure, Unit>> initialize() async {
    const initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
    );
    try {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(_channelId, _channelName),
          );
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      final initialized = await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
          debugPrint('notification payload: ' '${payload.payload}');
        },
        onDidReceiveBackgroundNotificationResponse:
            _backgroundNotificationResponse,
      );
      if (initialized != null && initialized) {
        return const Right(unit);
      } else {
        return Left(NotificationFailure());
      }
    } catch (e) {
      return Left(NotificationFailure());
    }
  }

  static void _backgroundNotificationResponse(NotificationResponse response) {
    response.payload;
    'Payload 2: ${response.payload}';
  }

  Future<Either<Failure, Unit>> showNotificationOnForeGround(
      RemoteMessage remoteMsg) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        importance: Importance.high,
        priority: Priority.max,
      ),
    );
    debugPrint('Notification title: ${remoteMsg.notification!.title}');
    debugPrint('NotificationDetails: $notificationDetails');
    try {
      await _flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond,
        remoteMsg.notification!.title,
        remoteMsg.notification!.body,
        notificationDetails,
        payload: remoteMsg.data.toString(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(NotificationFailure());
    }
  }

  static const _initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/launcher_icon',
  );
  static const _initializationSettingsIOS = DarwinInitializationSettings();

  static const _channelId = 'HomelyId';
  static const _channelName = 'Notifications';
}
