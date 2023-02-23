import 'package:flutter/material.dart';
import 'package:twitter_clone/features/auth/screen/login_screen.dart';
import 'package:twitter_clone/features/auth/screen/signup_screen.dart';
import 'package:twitter_clone/features/home/screen/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: ((context) => const LoginScreen()),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(builder: ((context) => const Scaffold()));
  }
}
