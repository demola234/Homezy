import 'package:get_it/get_it.dart';
import 'package:homezy/core/cache/app_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.I;

Future<void> injector() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
  
  // STORAGE
    ..registerLazySingleton<AppCache>(
        () => AppCacheImpl(sharedPreferences: sl()))

    // Shared Preferences
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
