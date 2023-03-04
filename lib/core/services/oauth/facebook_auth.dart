import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbAuthHandler {
  static Future<String> login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      final accessToken = await FacebookAuth.instance.accessToken;
      debugPrint(userData.toString());
      return accessToken!.token;
    } else {
      debugPrint(result.status.name);
      debugPrint(result.message);
      return '';
    }
  }

  static Future<String> checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      debugPrint(userData.entries.first.value);
      return accessToken.token;
    } else {
      return '';
    }
  }

  static Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
  }
}
