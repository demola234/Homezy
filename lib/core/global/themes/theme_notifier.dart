import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homezy/core/cache/app_cache.dart';
import 'package:homezy/core/global/themes/theme_state.dart';
import 'package:homezy/core/global/themes/themes.dart';
import 'package:homezy/locator.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  final appCache = sl<AppCache>();
  ThemeNotifier()
      : super(ThemeState.theme(
            themeData: AppTheme.themeOptions[ThemeOptions.Light]!));

  Future<void> setTheme(ThemeState theme) async {
    await appCache.saveThemeMode(theme.toString());
    state = ThemeState.theme(themeData: AppTheme.themeOptions[theme]!);
  }

  Future<ThemeData> getTheme() async {
    final theme = await appCache.getThemeMode();
    state = ThemeState.theme(themeData: AppTheme.themeOptions[theme]!);
    return AppTheme.themeOptions[theme]!;
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeState>((ref) => ThemeNotifier());
