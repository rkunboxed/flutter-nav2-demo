import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_qlevar/routes.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: QRouteInformationParser(),
        routerDelegate: QRouterDelegate(QlevarRoutes().routes),
      );
}
