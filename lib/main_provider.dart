import 'package:flutter/material.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_nav2_demo/common/route_data_model.dart';
import 'package:flutter_nav2_demo/demo_provider/route_manager.dart';
import 'package:provider/provider.dart';

import 'demo_provider/route_utils.dart';

void main() {
  //setUrlStrategy(PathUrlStrategy());
  //TODO figure out why entering path directly in address bar doesn't work w/PathUrlStrategy
  //for some reason the full reload of the app is triggered
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Nav 2 w/Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: DemoAppRouterDelegate(),
      routeInformationParser: DemoAppRouteInfoParser(),
    );
  }
}

//STATE MANAGED IN ROUTE MANAGER
class DemoAppRouterDelegate extends RouterDelegate<DemoAppRouteData> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  DemoAppRouterDelegate() {
    routeManager.addListener(notifyListeners);
  }
  final RouteManager routeManager = RouteManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RouteManager>.value(
      value: routeManager,
      child: Consumer<RouteManager>(
        builder: (context, routeManager, child) {
          return Navigator(
            key: navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(routeManager.pages),
          );
        },
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    /// Notify the PageManager that page was popped
    routeManager.didPop(route.settings);

    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => routeManager.navigatorKey;

  @override
  DemoAppRouteData get currentConfiguration => routeManager.currentRouteData;

  @override
  Future<void> setNewRoutePath(DemoAppRouteData configuration) async {
    await routeManager.setNewRoutePath(configuration);
  }
}

class DemoAppRouteInfoParser extends RouteInformationParser<DemoAppRouteData> {
  @override
  Future<DemoAppRouteData> parseRouteInformation(RouteInformation routeInformation) async {
    //returns a future to provide for maximum flexibility.
    //Example: you want to do a DB lookup on the route before returning the config

    if (routeInformation.location != null) {
      final uri = Uri.parse(routeInformation.location!);
      return RouteUtils.parseRoute(uri);
    }

    // Handle unknown routes
    return DemoAppRouteData.unknown();
  }

  //communicate back to the browser to update the URL bar
  @override
  RouteInformation restoreRouteInformation(DemoAppRouteData routeData) {
    if (routeData.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (routeData.isCountryPage) {
      return RouteInformation(location: '/country/${routeData.country}');
    }
    return RouteInformation(location: '/404');
  }
}
