import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/documents.dart';
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

  final List<Documents> docLists = [
    Documents(
        id: 1,
        image: 'assets/images/burger.png',
        name: 'Documents 1',
        date: 'Today',
        page: 1),
    Documents(
        id: 2,
        image: 'assets/images/cheese_dip.png',
        name: 'Documents 2',
        date: 'Yesterday',
        page: 2),
    Documents(
        id: 3,
        image: 'assets/images/cola.png',
        name: 'Documents 3',
        date: 'the other day',
        page: 3),
    Documents(
        id: 4,
        image: 'assets/images/fries.png',
        name: 'Documents 4',
        date: '26/12/2023',
        page: 4),
    Documents(
        id: 5,
        image: 'assets/images/ice_cream.png',
        name: 'Documents 5',
        date: '24/12/2023',
        page: 5),
    Documents(
        id: 6,
        image: 'assets/images/noodles.png',
        name: 'Documents 6',
        date: '20/12/2023',
        page: 6),
    Documents(
        id: 7,
        image: 'assets/images/pizza.png',
        name: 'Documents 7',
        date: '18/12/2023',
        page: 7),
    Documents(
        id: 8,
        image: 'assets/images/sandwich.png',
        name: 'Documents 8',
        date: '16/12/2023',
        page: 8),
    Documents(
        id: 9,
        image: 'assets/images/wrap.png',
        name: 'Documents 9',
        date: '14/12/2023',
        page: 9),
    Documents(
        id: 10,
        image: 'assets/images/burger.png',
        name: 'Documents 10',
        date: '12/12/2023',
        page: 10),
    Documents(
        id: 11,
        image: 'assets/images/wrap.png',
        name: 'Documents 11',
        date: '14/12/2023',
        page: 11),
    Documents(
        id: 12,
        image: 'assets/images/wrap.png',
        name: 'Documents 12',
        date: '14/12/2023',
        page: 12),
    Documents(
        id: 13,
        image: 'assets/images/wrap.png',
        name: 'Documents 13',
        date: '14/12/2023',
        page: 13),
    Documents(
        id: 14,
        image: 'assets/images/wrap.png',
        name: 'Documents 14',
        date: '14/12/2023',
        page: 14),
    Documents(
        id: 15,
        image: 'assets/images/wrap.png',
        name: 'Documents 15',
        date: '14/12/2023',
        page: 15),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double rate = widthDevice / 414;

    return SafeArea(
      child: Scaffold(
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
                  : content(widthDevice, heightDevice, rate, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(double widthDevice, double heightDevice, double rate,
      BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: const Text(
            'Star Scanner',
            style: AppTextStyles.semiBoldTeal24,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined,
                  color: AppColors.black, size: 24 * rate),
              onPressed: () {},
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return SizedBox(
                  width: widthDevice,
                  height: 270 * rate,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15 * rate, right: 15 * rate),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recent',
                          style: AppTextStyles.regularGrey16,
                        ),
                        SizedBox(height: 16 * rate),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: docLists.length,
                            itemBuilder: (context, index) {
                              final itemDoc = docLists[index];
                              return Container(
                                height: 191 * rate,
                                width: 224 * rate,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1 * rate,
                                    color: Colors.teal.shade50,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                      offset: Offset(0, 0),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      itemDoc.image,
                                      height: 121 * rate,
                                      width: 224 * rate,
                                      fit: BoxFit.fill,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 16 * rate,
                                          left: 16 * rate,
                                          right: 16 * rate),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 174 * rate,
                                            child: Text(itemDoc.name,
                                                style: AppTextStyles
                                                    .mediumDarkGrey14),
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                itemDoc.date,
                                                style: AppTextStyles
                                                    .regularGreySemi12,
                                              ),
                                              Text(
                                                '${itemDoc.page} page',
                                                style: AppTextStyles
                                                    .regularDarkGrey12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return SizedBox(
                  width: widthDevice,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15 * rate, right: 15 * rate, top: 24 * rate),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Documents',
                          style: AppTextStyles.regularGrey16,
                        ),
                        SizedBox(height: 16 * rate),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: docLists.length,
                          itemBuilder: (context, index) {
                            final itemDoc = docLists[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 16 * rate),
                              padding: EdgeInsets.only(
                                  left: 16 * rate, right: 16 * rate),
                              height: 100 * rate,
                              width: 342 * rate,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 1 * rate,
                                  color: Colors.teal.shade50,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.25),
                                    offset: Offset(0, 0),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Material(
                                    elevation: 4,
                                    // The elevation value to control the shadow intensity// Optional: Add rounded corners to the container
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 150, 136,
                                            0.05), // You can set a background color if needed
                                      ),
                                      child: Image.asset(
                                        itemDoc.image,
                                        height: 70 * rate,
                                        width: 50 * rate,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16 * rate),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200 * rate,
                                        child: Text(itemDoc.name,
                                            style:
                                                AppTextStyles.mediumDarkGrey14),
                                      ),
                                      SizedBox(height: 10 * rate),
                                      SizedBox(
                                        width: 260 * rate,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              itemDoc.date,
                                              style: AppTextStyles
                                                  .regularGreySemi12,
                                            ),
                                            Text(
                                              '${itemDoc.page} page',
                                              style: AppTextStyles
                                                  .regularDarkGrey12,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
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
              'Sync docs across smartphones, tablets, and computers',
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
