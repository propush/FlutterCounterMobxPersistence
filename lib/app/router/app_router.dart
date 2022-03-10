import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test10/app/router/error_screen.dart';
import 'package:test10/counter/screens/counter_screen.dart';

@singleton
class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CounterScreen.routeName:
        return MaterialPageRoute(builder: (_) => CounterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
