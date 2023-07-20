import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_scanner/utils/app_text_styles.dart';
import 'package:star_scanner/utils/constants.dart';

import '../routers/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationNext();
  }

  _navigationNext() async {
    await Future.delayed(const Duration(milliseconds: 3000))
        .then((value) => _route());
  }

  _route() {
    Navigator.pushNamed(context, RoutePaths.onboardRoute);
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double rate = widthDevice / 414;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SvgPicture.asset(
              Constants.splashSVG,
              alignment: Alignment.centerRight,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              child: content(rate),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(double rate) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          Constants.logoSVG,
          fit: BoxFit.fill,
          height: 80 * rate,
          width: 80 * rate,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16 * rate),
          child: const Text(
            'StarScanner',
            style: AppTextStyles.semiBoldTeal20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6 * rate,
          ),
          child: const Text(
            'ver. 1.0',
            style: AppTextStyles.lightDarkGrey14,
          ),
        ),
      ]),
    );
  }
}
