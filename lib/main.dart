import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homezy/core/routes/app_routers_part.dart';
import 'package:homezy/firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    //* Remove native splash screen
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
    //* Initialize firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //* Force crash for testing
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //* Initialize go_router
    final router = ref.watch(goRoutesProvider);
    return MaterialApp.router(
      theme: ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 15,
          opacity: 10,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
