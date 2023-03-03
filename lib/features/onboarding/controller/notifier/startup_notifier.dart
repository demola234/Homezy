import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homezy/core/cache/app_cache.dart';
import 'package:homezy/features/onboarding/controller/state/startup_notifier.dart';
import 'package:homezy/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider extends StateNotifier<StartUp> {
  AppStateProvider() : super(const StartUp.onboarding());

  Future<void> checkOnboarding() async {
    // Retrieve data from shared preferences and AppStorage
    final pref = await SharedPreferences.getInstance();
    final onBoarded = sl<AppCache>().getOnboarding();

    // Determine the state
    if (onBoarded == false) {
      state = const StartUp.onboarding();
    } else if (onBoarded) {
      state = const StartUp.home();
    } else {
      state = const StartUp.onboarding();
    }
  }
}

// This is the provider that will be used in the main.dart file
final onboardingNotifierProvider =
    StateNotifierProvider<AppStateProvider, StartUp>(
  (ref) => AppStateProvider(),
);
