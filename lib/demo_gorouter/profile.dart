import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_gorouter/app_state.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Text('HURRAY you logged in!'),
              SizedBox(height: 10),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(200, 55)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(top: 20, bottom: 20)),
                ),
                onPressed: () {
                  Provider.of<AppState>(context, listen: false).setRouteAuthorized(false);
                },
                child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
