import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/demo_gorouter/app_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 55)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(top: 20, bottom: 20)),
          ),
          onPressed: () {
            Provider.of<AppState>(context, listen: false).setRouteAuthorized(true);
            GoRouter.of(context).go('/profile');
          },
          child: const Text('LOGIN', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
