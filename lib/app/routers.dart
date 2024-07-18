import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'modules/assets_module/presentation/assets_page.dart';
import 'modules/home/presentation/home_page.dart';
import 'modules/splash/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class Routers {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/assets/:companyId',
        builder: (context, state) {
          return AssetsPage(companyId: state.pathParameters['companyId'] ?? '');
        },
      ),
    ],
  );
}
