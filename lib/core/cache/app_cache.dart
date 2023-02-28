import 'package:get_storage/get_storage.dart';
import 'package:homezy/core/cache/app_cache_const.dart';
import 'package:homezy/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppStorage {
  Future<void> savePusNotificationToken(String value);
  Future<String> getPusNotificationToken();
}

class AppStorageImpl implements AppStorage {
  final SharedPreferences sharedPreferences;
  final box = GetStorage();

  AppStorageImpl({required this.sharedPreferences});

  @override
  Future<void> savePusNotificationToken(String value) {
    try {
      return sharedPreferences.setString(
          AppCacheKey.pushNotificationToken, value);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<String> getPusNotificationToken() async {
    try {
      final pushToken =
          sharedPreferences.getString(AppCacheKey.pushNotificationToken);
      return Future.value(pushToken);
    } on CacheException {
      throw CacheException();
    }
  }
}
