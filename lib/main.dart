import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_basic/home.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //use Navigator widget w/ new pages argument
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('VacationDestinationsList'),
            child: HomePage(
              title: 'Flutter Router Based Navigation Demo',
            ),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
