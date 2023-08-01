import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_scanner/screen/DocumentScreen.dart';
import 'package:star_scanner/screen/SettingScreen.dart';
import 'package:star_scanner/utils/app_colors.dart';
import 'package:star_scanner/utils/app_text_styles.dart';
import 'package:star_scanner/utils/constants.dart';

bool toggle = true;

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

  File? image;
  Future pickImage(source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double rate = widthDevice / 414;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: PageStorage(
          bucket: bucket,
          child: _currentScreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 18 * rate),
          child: Stack(
            children: [
              Visibility(
                visible: !toggle,
                child: Positioned.fill(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 61 * rate),
                    color: Colors.black.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20 * rate),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16 * rate)),
                          height: 100 * rate,
                          width: 160 * rate,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.tealPrimary,
                              minimumSize: Size(160 * rate, 50 * rate),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              pickImage(ImageSource.camera);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  Constants.cameraSVG,
                                  height: 36 * rate,
                                  width: 36 * rate,
                                  fit: BoxFit.fill,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.tealPrimary, BlendMode.srcIn),
                                ),
                                const Text('Camera',
                                    style: AppTextStyles.mediumTeal16),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20 * rate),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16 * rate)),
                          height: 100 * rate,
                          width: 160 * rate,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.tealPrimary,
                              minimumSize: Size(160 * rate, 50 * rate),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  Constants.gallerySVG,
                                  height: 36 * rate,
                                  width: 36 * rate,
                                  fit: BoxFit.fill,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.tealPrimary, BlendMode.srcIn),
                                ),
                                const Text('Gallery',
                                    style: AppTextStyles.mediumTeal16),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: toggle ? 46 * rate : 50 * rate,
                  width: toggle ? 120 * rate : 107 * rate,
                  decoration: BoxDecoration(
                    color: AppColors.tealPrimary,
                    borderRadius: BorderRadius.circular(toggle ? 10 : 1000),
                  ),
                  child: MaterialButton(
                    splashColor: AppColors.tealLight,
                    onPressed: () {
                      setState(() {
                        if (toggle) {
                          toggle = !toggle;
                        } else {
                          toggle = !toggle;
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          toggle ? Icons.add : Icons.close,
                          color: AppColors.white,
                          size: toggle ? 24 * rate : 30 * rate,
                        ),
                        Text(
                          toggle ? 'SCAN' : '',
                          style: toggle ? AppTextStyles.mediumWhite14 : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.tealLight,
          child: Container(
            margin: EdgeInsets.only(left: 35 * rate, right: 35 * rate),
            height: 80 * rate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 60 * rate,
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
                      minWidth: 60 * rate,
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

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('This is the content of the alert.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
