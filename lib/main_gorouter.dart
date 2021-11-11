import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/custom_scroll.dart';
import 'package:flutter_nav2_demo/common/not_found_page.dart';
import 'package:flutter_nav2_demo/demo_gorouter/app_state.dart';
import 'package:flutter_nav2_demo/demo_gorouter/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  //I want to check whether the user is logged right away so initializing app state here
  final AppState appState = AppState();
  runApp(DemoApp(appState));
}

class DemoApp extends StatelessWidget {
  DemoApp(this.appState, {Key? key}) : super(key: key);
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appState,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Nav 2 w/Go_Router Demo',
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            scrollBehavior: CustomScrollBehavior(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }

  late final _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path, //removes the hash
    routes: GoRouterRoutes.routes,
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: NotFoundPage(),
    ),
    redirect: (state) {
      final loggedIn = appState.routeAuthorized;
      final goingToProtectedRoute = protectedRoutes.contains(state.location);

      // the user is not logged in and not headed to an unauth route, they need to login
      if (!loggedIn && goingToProtectedRoute) {
        return '/login';
      }

      // no need to redirect at all
      return null;
    },
    refreshListenable: appState,
  );
}

//These routes can only be accessed by authenticated users
final List<String> protectedRoutes = ['/profile'];
