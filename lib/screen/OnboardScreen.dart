import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_scanner/utils/app_colors.dart';

import '../routers/routes.dart';
import '../utils/app_text_styles.dart';
import '../utils/constants.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double rate = widthDevice / 414;
    double rateHeight = heightDevice / 844;

    route() {
      Navigator.pushNamed(context, RoutePaths.homeRoute);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SvgPicture.asset(
              Constants.onboardSVG,
              alignment: Alignment.centerRight,
              fit: BoxFit.fill,
              width: widthDevice,
            ),
            Container(
              child: content(rate, rateHeight),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(double rate, double rateHeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 141 * rateHeight),
              child: SvgPicture.asset(
                Constants.scanQrSVG,
                alignment: Alignment.center,
                height: 203 * rateHeight,
                width: 203 * rate,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80 * rateHeight, left: 43 * rate),
              child: const Text(
                'Scan Everywhere',
                style: AppTextStyles.semiBoldBlack24,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15 * rateHeight, left: 43 * rate),
              child: const Text(
                'Scan documents everywhere everytime from your pocket.',
                style: AppTextStyles.lightDarkGrey16,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 210 * rateHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.homeRoute);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        top: 12 * rateHeight,
                        bottom: 12 * rateHeight,
                        left: 24 * rate,
                        right: 24 * rate),
                    fixedSize: Size(342 * rate, 46 * rate),
                    textStyle: AppTextStyles.lightWhite14,
                    backgroundColor: AppColors.tealPrimary,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8 * rate))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEXT',
                    ),
                    Icon(Icons.arrow_right_alt)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
