part of 'app_routers_part.dart';

final goRoutesProvider = Provider<GoRouter>((ref) {
  final routes = RouterNotifier(ref);
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey(debugLabel: 'root');
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: routes._routes,
    debugLogDiagnostics: true,
    refreshListenable: routes,
    errorBuilder: (context, state) => RouteErrorScreen(
      errMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref);

  List<GoRoute> get _routes => [
        GoRoute(
            path: '/',
            name: RouteConstants.onboarding,
            builder: (context, state) => OnboardingScreen(
                  key: state.pageKey,
                ),
            routes: [
              GoRoute(
                path: 'welcome',
                name: RouteConstants.welcome,
                builder: (context, state) => WelcomeScreen(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'login',
                    name: RouteConstants.login,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: const LoginScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's
                          // value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc)
                                .animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'register',
                name: RouteConstants.register,
                builder: (context, state) => RegistrationScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: 'verifyEmail',
                name: RouteConstants.verifyEmail,
                builder: (context, state) => VerifyEmailOtp(
                  email: state.queryParams['email']!,
                  key: state.pageKey,
                ),
              )
            ]),
      ];
}
