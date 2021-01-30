// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:x_sb5/core/router_constants.dart';

import 'package:x_sb5/views/splash/splash_view.dart' as view0;
import 'package:x_sb5/views/sign_up/sign_up_view.dart' as view1;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashView());
      case signUpViewRoute:
        return MaterialPageRoute(builder: (_) => view1.SignUpView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}