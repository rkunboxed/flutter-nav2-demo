import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/route_config.dart';
import 'package:flutter_nav2_demo/demo_provider/country_landing.dart';
import 'package:flutter_nav2_demo/demo_provider/home.dart';
import 'package:flutter_nav2_demo/common/not_found_page.dart';
import 'package:flutter_nav2_demo/demo_provider/route_utils.dart';

class RouteManager extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Page> get pages => List.unmodifiable(_pages);

  final List<Page> _pages = [
    MaterialPage(
      child: HomePage(title: 'Flutter Router Nav Demo'),
      key: const ValueKey('HomePage'),
      name: '/',
    ),
  ];

  DemoAppRouteConfig get currentRouteData {
    return RouteUtils.parseRoute(Uri.parse(_pages.last.name!));
  }

  void didPop(RouteSettings settings) {
    _pages.removeWhere((page) => page.name == settings.name);
    notifyListeners();
  }

  /// This is where we handle new route information and manage the pages list
  Future<void> setNewRoutePath(DemoAppRouteConfig configuration) async {
    if (configuration.isUnknown) {
      // Handling 404
      _pages.add(
        MaterialPage(
          child: NotFoundPage(),
          key: UniqueKey(),
          name: '/404',
        ),
      );
    } else if (configuration.isCountryPage) {
      // Handling country screens
      _pages.add(
        MaterialPage(
          child: CountryLanding(configuration.country!),
          key: UniqueKey(),
          name: '/country/${configuration.country}',
        ),
      );
    } else if (configuration.isHomePage) {
      // Restoring to MainScreen
      _pages.removeWhere(
        (element) => element.key != const ValueKey('HomePage'),
      );
    }
    notifyListeners();
    return;
  }

  DemoAppRouteConfig parseRoute(Uri uri) {
    List<String> countries = ['italy', 'spain', 'holland', 'columbia'];

    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return DemoAppRouteConfig.home();
    }

    // Handle '/country/:country'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'country') {
        if (countries.contains(uri.pathSegments[1])) {
          return DemoAppRouteConfig.country(uri.pathSegments[1]);
        }
      }
    }

    // Handle unknown routes
    return DemoAppRouteConfig.unknown();
  }
}
