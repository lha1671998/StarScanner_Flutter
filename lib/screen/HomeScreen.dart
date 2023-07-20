import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_scanner/screen/DocumentScreen.dart';
import 'package:star_scanner/screen/SettingScreen.dart';
import 'package:star_scanner/utils/app_colors.dart';
import 'package:star_scanner/utils/app_text_styles.dart';
import 'package:star_scanner/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currenTab = 0;

  final List<Widget> screens = [
    const DocumentScreen(),
    const SettingScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreen = const DocumentScreen();

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double rate = widthDevice / 414;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            title: const Text(
              'Star Scanner',
              style: AppTextStyles.semiBoldTeal24,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false),
        body: PageStorage(
          bucket: bucket,
          child: _currentScreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 100 * rate),
          child: FloatingActionButton.extended(
            onPressed: () {},
            elevation: 8 * rate,
            foregroundColor: AppColors.white,
            label: const Text(
              'SCAN',
              style: AppTextStyles.mediumWhite14,
            ),
            backgroundColor: AppColors.tealPrimary,
            icon: Icon(
              Icons.add,
              size: 20 * rate,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.tealLight,
          child: Container(
            height: 100 * rate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 140 * rate,
                      onPressed: () {
                        setState(() {
                          _currentScreen = const DocumentScreen();
                          _currenTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                              Constants.docSVG,
                              width: 35 * rate,
                              height: 35 * rate,
                              color: _currenTab == 0
                                  ? AppColors.tealPrimary
                                  : AppColors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2 * rate),
                            width: 22 * rate,
                            height: 2 * rate,
                            decoration: BoxDecoration(
                              color: _currenTab == 0
                                  ? AppColors.tealPrimary
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 140 * rate,
                      onPressed: () {
                        setState(() {
                          _currentScreen = const SettingScreen();
                          _currenTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                              Constants.settingSVG,
                              width: 35 * rate,
                              height: 35 * rate,
                              color: _currenTab == 1
                                  ? AppColors.tealPrimary
                                  : AppColors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2 * rate),
                            width: 22 * rate,
                            height: 2 * rate,
                            decoration: BoxDecoration(
                              color: _currenTab == 1
                                  ? AppColors.tealPrimary
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
