import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:homezy/core/global/themes/theme_notifier.dart';
import 'package:homezy/core/global/themes/themes.dart';
import 'package:homezy/core/routes/app_routers_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    //* Initialize go_router
    final router = ref.watch(goRoutesProvider);
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      theme: theme.maybeWhen(
        orElse: () => AppTheme.themeOptions[ThemeOptions.Dark],
        theme: (theme) => theme,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
