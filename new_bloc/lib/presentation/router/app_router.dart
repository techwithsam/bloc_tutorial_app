import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'HomeScreen',
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'SecondScreen',
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'thirdScreen',
            color: Colors.greenAccent,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'thirdScreen',
            color: Colors.greenAccent,
          ),
        );
    }
  }
}
