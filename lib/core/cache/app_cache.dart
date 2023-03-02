import 'package:get_storage/get_storage.dart';
import 'package:homezy/core/cache/app_cache_const.dart';
import 'package:homezy/core/global/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppCache {
  Future<void> savePusNotificationToken(String value);
  Future<String> getPusNotificationToken();
  Future<void> saveThemeMode(String value);
  Future<String> getThemeMode();
}

class AppCacheImpl implements AppCache {
  final SharedPreferences sharedPreferences;
  final box = GetStorage();

  AppCacheImpl({required this.sharedPreferences});

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

  @override
  Future<String> getThemeMode() {
    try {
      final themeMode = box.read(AppCacheKey.themeMode);
      return Future.value(themeMode);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> saveThemeMode(String value) {
    try {
      return box.write(AppCacheKey.themeMode, value);
    } on CacheException {
      throw CacheException();
    }
  }
}
