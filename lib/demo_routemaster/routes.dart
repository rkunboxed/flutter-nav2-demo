import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_nav2_demo/common/not_found_page.dart';
import 'package:flutter_nav2_demo/demo_routemaster/country_landing.dart';
import 'package:flutter_nav2_demo/demo_routemaster/home.dart';
import 'package:flutter_nav2_demo/demo_routemaster/login.dart';
import 'package:flutter_nav2_demo/demo_routemaster/app_state.dart';
import 'package:flutter_nav2_demo/demo_routemaster/profile.dart';

class RoutemasterRoutes {
  static RouteMap buildRouteMap(AppState appState) {
    return RouteMap(
      onUnknownRoute: (path) {
        return MaterialPage(
          child: NotFoundPage(),
        );
      },
      routes: {
        '/': (_) => MaterialPage(
              child: HomePage(title: 'Flutter Demo'),
            ),
        '/login': (_) => MaterialPage(
              child: LoginPage(),
            ),
        '/country/:country': (route) => _isValidCountry(route.pathParameters['country'])
            ? MaterialPage(
                child: CountryLanding(
                  route.pathParameters['country']!,
                ),
              )
            : NotFound(),
        '/profile': (route) {
          if (!appState.routeAuthorized) return Redirect('/login');
          return MaterialPage(child: ProfilePage());
        }
      },
    );
  }

  static bool _isValidCountry(String? country) {
    //you would probably grab this from a DB somewhere but hard coding for demo
    List<String> countries = ['italy', 'spain', 'holland', 'columbia'];
    return countries.contains(country);
  }
}
