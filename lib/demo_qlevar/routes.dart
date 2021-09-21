import 'package:flutter_nav2_demo/demo_qlevar/country_landing.dart';
import 'package:flutter_nav2_demo/demo_qlevar/home.dart';
import 'package:qlevar_router/qlevar_router.dart';

class QlevarRoutes {
  static String homePage = 'Home Page';
  // static String countryPage = 'Country Page';
  //static String userPage = 'User Page';
  final routes = [
    QRoute(name: homePage, path: '/', builder: () => HomePage(title: 'Flutter Qlevar Demo')),
    QRoute(path: '/country/:country', builder: () => CountryLanding())

    // child pages (not sure what this is for)
    // QRoute(
    //     name: userPage,
    //     path: '/user/:userId',
    //     builder: () => HomePage(),
    //     children: [
    //       QRoute(name: homePage, path: '/settings', builder: () => SettingsPage()),
    //       QRoute(name: homePage, path: '/profile', builder: () => ProfilePage()),
    //     ]),
    //QRoute(path: '/products/:category(\w)', builder: () => ProductCategory()),
    // QRoute(path: '/products/:id((^[0-9]\$))', builder: () => ProductDetails()),
  ];
}
