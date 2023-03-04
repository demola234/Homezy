import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHandler {
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/userinfo.email'
    ],
  );

  static Future<Map<String, String>?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        final accessToken = await Future.value(account.authHeaders);
        return accessToken;
      }
    } catch (e) {
      debugPrint('An error occurred${e.toString()}');
      return null;
    }
    return null;
  }

  static Future<void> signOutGoogle() async {
    debugPrint("loggedOut");
    await _googleSignIn.signOut();
  }
}
