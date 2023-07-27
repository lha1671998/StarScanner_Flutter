import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double rate = widthDevice / 414;

    bool value = true;
    onChanged(bool newValue) {
      setState(
        () {
          value = newValue;
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Settings',
              style: AppTextStyles.semiBoldTeal24,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false),
        backgroundColor: AppColors.white,
        body: Stack(
          children: <Widget>[
            SvgPicture.asset(
              Constants.primarySVG,
              alignment: Alignment.centerRight,
              fit: BoxFit.fill,
              width: widthDevice,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20 * rate),
              decoration: const BoxDecoration(
                color: AppColors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    settingComponent(Constants.cropSVG, 'Allow gallery photo editing', value, onChanged, rate, true),
                    settingComponent(Constants.cameraSVG, 'Start camera at start up', value, onChanged, rate, true),
                    settingComponent(Constants.binSVG, 'Confirm on swipe delete', value, onChanged, rate, true),
                    settingComponent(Constants.sendSVG, 'Show walkthrough at launch', value, onChanged, rate, true),
                    settingComponent(Constants.policySVG, 'Privacy Policy', value, onChanged, rate, false),
                    settingComponent(Constants.termsSVG, 'Terms & Conditions', value, onChanged, rate, false)
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget settingComponent(String icon, String label, bool value,
      Function onChanged, double rate, bool displaySwitch) {
    return Container(
      alignment: Alignment.center,
      margin:
          EdgeInsets.only(left: 15 * rate, right: 15 * rate, top: 10 * rate),
      padding: EdgeInsets.only(
          left: 16 * rate, right: 16 * rate, top: 24 * rate, bottom: 24 * rate),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.teal.shade50,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            offset: Offset(0, 0),
            blurRadius: 1,
          ),
        ],
        color: AppColors.whiteOpacity,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                fit: BoxFit.fill,
                colorFilter: const ColorFilter.mode(
                    AppColors.tealPrimary, BlendMode.srcIn),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12 * rate),
                child: Text(
                  label,
                  style: AppTextStyles.regularDarkGrey14,
                ),
              )
            ],
          ),
          if (displaySwitch) // Sử dụng điều kiện để kiểm tra và thêm CupertinoSwitch
            CupertinoSwitch(
              trackColor: AppColors.greyLight2,
              activeColor: AppColors.tealPrimary,
              value: value,
              onChanged: (newValue) {
                onChanged(newValue);
              },
            ),
        ],
      ),
    );
  }
}
