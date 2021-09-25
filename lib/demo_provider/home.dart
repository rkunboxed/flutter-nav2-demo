import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/route_config.dart';
import 'package:flutter_nav2_demo/demo_provider/route_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    RouteManager routeManager = Provider.of<RouteManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Popular Vacation Destinations',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Italy', style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        routeManager.setNewRoutePath(DemoAppRouteConfig.country('italy'));
                      },
                      child: Image.asset('assets/images/italy/1.jpg', width: 400),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text('Spain', style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        routeManager.setNewRoutePath(DemoAppRouteConfig.country('spain'));
                      },
                      child: Image.asset('assets/images/spain/1.jpg', width: 400),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
