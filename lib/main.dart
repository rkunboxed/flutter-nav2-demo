import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/custom_scroll.dart';
import 'package:flutter_nav2_demo/demo_basic/home.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final List<Page> _pages = [];

  void _addPage(Page newPage) {
    setState(() {
      _pages.add(newPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _addPage(MaterialPage(
      key: ValueKey('VacationDestinationsList'),
      child: HomePage(
        title: 'Flutter Router Based Navigation Demo',
        callback: _addPage,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //use Navigator widget w/ new pages argument
      home: Navigator(
        pages: List.unmodifiable(_pages),
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by removing the last page
          setState(() {
            _pages.removeLast();
          });

          return true;
        },
      ),
    );
  }
}
