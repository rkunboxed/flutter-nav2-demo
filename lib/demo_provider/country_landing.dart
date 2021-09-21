import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/route_data_model.dart';
import 'package:flutter_nav2_demo/demo_provider/route_manager.dart';
import 'package:provider/provider.dart';

class CountryLanding extends StatelessWidget {
  const CountryLanding(this.country, {Key? key}) : super(key: key);

  final String country;

  @override
  Widget build(BuildContext context) {
    RouteManager routeManager = Provider.of<RouteManager>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(country.toUpperCase()),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/images/image-list.json'),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final fullImageList = jsonDecode(snapshot.data.toString());
              if (fullImageList[country] != null && fullImageList[country].isNotEmpty) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fullImageList[country].length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/$country/${index + 1}.jpg', width: 550),
                      );
                    });
              } else {
                return Center(child: Text('No info for $country, check back soon!'));
              }
            }
            return const SizedBox.shrink();
          },
        ),
        bottomNavigationBar: Builder(builder: (BuildContext context) {
          if (country != 'italy') {
            return TextButton(
              onPressed: () {
                routeManager.setNewRoutePath(DemoAppRouteData.country('italy'));
              },
              child: Text('I like Italy better.'),
            );
          } else if (country != 'spain') {
            return TextButton(
              onPressed: () {
                routeManager.setNewRoutePath(DemoAppRouteData.country('spain'));
              },
              child: Text('Spain is really the best.'),
            );
          }
          return const SizedBox.shrink();
        }));
  }
}
