import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_nav2_demo/demo_gorouter/country_landing.dart';
import 'package:flutter_nav2_demo/demo_gorouter/home.dart';
import 'package:flutter_nav2_demo/common/login.dart';

class GoRouterRoutes {
  static List<GoRoute> _routes = [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: HomePage(title: 'Flutter Demo'),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: '/country/:country',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: CountryLanding(state.params['country']!),
      ),
    ),
  ];

  static get routes => _routes;
}
