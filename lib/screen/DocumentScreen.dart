import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/constants.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<String> docArray = ['a'];
  static const dataTest = [
    {
      "name":"Burger",
      "brand":"Hawkers",
      "price":2.99,
      "image":"burger.png"
    },{
      "name":"Cheese Dip",
      "brand":"Hawkers",
      "price":4.99,
      "image":"cheese_dip.png"
    },
    {
      "name":"Cola",
      "brand":"Mcdonald",
      "price":1.49,
      "image":"cola.png"
    },
    {
      "name":"Fries",
      "brand":"Mcdonald",
      "price":2.99,
      "image":"fries.png"
    },
    {
      "name":"Ice Cream",
      "brand":"Ben & Jerry's",
      "price":9.49,
      "image":"ice_cream.png"
    },
    {
      "name":"Noodles",
      "brand":"Hawkers",
      "price":4.49,
      "image":"noodles.png"
    },
    {
      "name":"Pizza",
      "brand":"Dominos",
      "price":17.99,
      "image":"pizza.png"
    },
    {
      "name":"Sandwich",
      "brand":"Hawkers",
      "price":2.99,
      "image":"sandwich.png"
    },
    {
      "name":"Wrap",
      "brand":"Subway",
      "price":6.99,
      "image":"wrap.png"
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  // void addHoaQua() {
  //   setState(() {
  //     docArray = ['s']; // Cập nhật hoaQua để chứa ít nhất một phần tử
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double rate = widthDevice / 414;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Star Scanner',
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
              height: heightDevice,
              width: widthDevice,
              child: docArray.isEmpty
                  ? noDocument(widthDevice, heightDevice, rate)
                  : content(widthDevice, heightDevice, rate),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(double widthDevice, double heightDevice, double rate) {
    return Container(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
              ),
              height: heightDevice * 0.35,
              width: widthDevice,
              child: Padding(
                padding: EdgeInsets.only(left: 15 * rate, right: 15 * rate),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent',
                      style: AppTextStyles.regularGrey16,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
              ),
              height: heightDevice * 0.448,
              width: widthDevice,
              child: Padding(
                padding: EdgeInsets.only(left: 15 * rate, right: 15 * rate),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Documents',
                      style: AppTextStyles.regularGrey16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noDocument(double width, double height, double rate) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Constants.docAddSVG,
            fit: BoxFit.fill,
            height: 142 * rate,
            width: 130 * rate,
          ),
          SizedBox(
            height: 30 * rate,
          ),
          const Text(
            'You don’t have any documents',
            style: AppTextStyles.semiBoldGrey18,
          ),
          SizedBox(
            height: 8 * rate,
          ),
          SizedBox(
            width: 259 * rate,
            child: const Text(
              'Sync docs accross smartphones, tablets, and computers',
              style: AppTextStyles.regularGrey10,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30 * rate,
          ),
          SvgPicture.asset(
            Constants.arrowDownLongSVG,
            fit: BoxFit.fill,
            height: 80 * rate,
            color: AppColors.tealPrimary,
          ),
        ],
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
