//Điều hướng giữa các màn hình

import 'package:flutter/material.dart';
import 'package:star_scanner/routers/routes.dart';
import 'package:star_scanner/screen/DocumentScreen.dart';
import 'package:star_scanner/screen/HomeScreen.dart';
import 'package:star_scanner/screen/OnboardScreen.dart';
import 'package:star_scanner/screen/SettingScreen.dart';
import '../screen/SplashScreen.dart';

class RouterPage {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case RoutePaths.onboardRoute:
        {
          return MaterialPageRoute(builder: (_) => const OnboardScreen());
        }
      case RoutePaths.homeRoute:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case RoutePaths.settingRoute:
        {
          return MaterialPageRoute(builder: (_) => const SettingScreen());
        }
      case RoutePaths.documentRoute:
        {
          return MaterialPageRoute(builder: (_) => const DocumentScreen());
        }
      default:
        {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                        child: Text('No route defined for ${settings.name}')),
                  ));
        }
    }
  }
}
