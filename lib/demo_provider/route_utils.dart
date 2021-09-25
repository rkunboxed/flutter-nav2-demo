import 'package:flutter_nav2_demo/common/route_config.dart';

class RouteUtils {
  static DemoAppRouteConfig parseRoute(Uri uri) {
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
