
// ignore_for_file: unused_field

part of 'app_routers_part.dart';

final goRoutesProvider = Provider<GoRouter>((ref) {
  final routes = RouterNotifier(ref);
  return GoRouter(
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
          name: RouteConstants.splash,
          builder: (context, state) => const Onboard(),
        ),
      ];
}
