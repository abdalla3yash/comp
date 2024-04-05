import 'package:comp/core/view/screens/undefined_route_screen.dart';
import 'package:comp/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Routes.mainScreen:
        return platformPageRoute(const HomeScreen());

      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
