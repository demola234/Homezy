import 'package:flutter/material.dart';
import 'package:homezy/core/global/themes/theme_notifier.dart';
import 'package:homezy/core/global/themes/themes.dart';
import 'package:homezy/core/routes/app_routers_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
