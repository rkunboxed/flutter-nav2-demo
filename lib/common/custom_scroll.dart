import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Without this we can't scroll our listviews with the mouse
  // https://flutter.dev/docs/release/breaking-changes/default-scroll-behavior-drag
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
