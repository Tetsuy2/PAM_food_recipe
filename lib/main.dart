import 'dart:ui';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    print("UNCAUGHT ERROR: $error");
    print(stack);
    return true;
  };

  runApp(const FoodApp());
}
