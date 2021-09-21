import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_routemaster/app_state.dart';
import 'package:flutter_nav2_demo/demo_routemaster/routes.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
              final appState = Provider.of<AppState>(context);
              return RoutemasterRoutes().buildRouteMap(appState);
            }),
            routeInformationParser: RoutemasterParser(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
