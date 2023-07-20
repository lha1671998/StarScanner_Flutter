
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_scanner/routers/router.dart';
import 'package:star_scanner/routers/routes.dart';
import 'package:star_scanner/screen/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Star Scanner',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const SplashScreen(),
      initialRoute: RoutePaths.splashRoute,
      onGenerateRoute: RouterPage.generateRoute,
    );
  }
}