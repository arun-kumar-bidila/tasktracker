import 'package:flutter/material.dart';
import 'package:tasktracker/auth/screens/signin_screen.dart';
import 'package:tasktracker/auth/screens/signup_screen.dart';

Route<dynamic> generateRouteSettings(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignupScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignupScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SigninScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text("This page doesn't exist"),
                ),
              ));
  }
}
