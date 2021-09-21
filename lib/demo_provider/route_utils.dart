import 'package:flutter_nav2_demo/common/route_data_model.dart';

class RouteUtils {
  static DemoAppRouteData parseRoute(Uri uri) {
    List<String> countries = ['italy', 'spain', 'holland', 'columbia'];

    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return DemoAppRouteData.home();
    }

    // Handle '/country/:country'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'country') {
        if (countries.contains(uri.pathSegments[1])) {
          return DemoAppRouteData.country(uri.pathSegments[1]);
        }
      }
    }

    // Handle unknown routes
    return DemoAppRouteData.unknown();
  }
}
