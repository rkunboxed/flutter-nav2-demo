import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool routeAuthorized = false;

  void setRouteAuthorized(bool value) {
    routeAuthorized = value;
    notifyListeners();
  }
}
