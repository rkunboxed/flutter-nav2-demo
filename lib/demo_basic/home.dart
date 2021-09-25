import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_basic/country_landing.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, required this.callback}) : super(key: key);

  final String title;
  final void Function(Page) callback;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                        widget.callback(MaterialPage(key: UniqueKey(), child: CountryLanding('italy')));
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
                        widget.callback(MaterialPage(key: UniqueKey(), child: CountryLanding('spain')));
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
