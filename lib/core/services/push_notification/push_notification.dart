// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationTokenMessenger {
  final FirebaseMessaging _firebaseMessaging;

  PushNotificationTokenMessenger._internal({
    required FirebaseMessaging firebaseMessaging,
  }) : _firebaseMessaging = firebaseMessaging;

  static final PushNotificationTokenMessenger instance =
      PushNotificationTokenMessenger._internal(
    firebaseMessaging: FirebaseMessaging.instance,
  );

  Future<void> initialize() async {
    await _getPushNotificationToken();
    _refreshOnPushNotificationTokenChange();
  }

  Future<void> _getPushNotificationToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      debugPrint('Push_Notification_Token: $token');
      //  sl<AppStorage>().savePusNotificationToken(token);
    }
  }

  Future<void> _refreshOnPushNotificationTokenChange() async {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      // sl<AppStorage>().savePusNotificationToken(token);
     debugPrint('Push_Notification_Token: $token');
    }).onError((err) {
      print(err);
    });
  }
}
