import 'package:flutter/material.dart';
import 'package:flutter_ar/features/splash/persentation/splashscree.dart';
import 'package:flutter_ar/router/routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/persentation/screens/dashboard_screen.dart';

final goRouterProvider = Provider((ref) => _router);

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesPath.splash,
      name: Routes.splashscreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutesPath.dashboard,
      name: Routes.dashboard.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const DashBoardScreen(),
        );
      },
    ),
  ],
);

class RoutesPath {
  static const String splash = '/';
  static const String dashboard = '/dashboard';
}
