import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/Pages/qrScan.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/globalwidgets.dart';
import 'functions/walalet_operations.dart';
import 'qrScan.dart';
final walletCtrl = Get.put(WalletCtrl());
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController(); // Declare _pageController

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              children: [
                customAppBar(
                    myHeight: myHeight, context: context, myWidth: myWidth),
                SizedBox(
                  height: myHeight * 0.04,
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      homebigCard(
                        myWidth: myWidth,
                        myHeight: myHeight,
                        context: context
                      ),
                      homebigCard(
                        myWidth: myWidth,
                        myHeight: myHeight,
                        context: context
                      ),
                      // Add more cards if needed
                    ],
                  ),
                ),
                SmoothPageIndicator(
                controller: _pageController,  // PageController for PageView
                count:  2,  // The number of pages
                effect:  SlideEffect(  // Your choice of effect
                  spacing:  8.0,
                  radius:  4.0,
                  dotWidth:  24.0,
                  dotHeight:  16.0,
                  paintStyle:  PaintingStyle.fill,
                  strokeWidth:  1.5,
                  dotColor:  Colors.grey,
                  activeDotColor:  Colors.blue
                ),
              ),

                Padding(
                  padding: EdgeInsets.only(
                      top: myHeight * 0.02,
                      left: myWidth * 0.08,
                      right: myWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      // Text(
                      //   'view all ',
                      //   style:
                      //   TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color:  AppColors.whiteColor),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.08, vertical: myHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // myItemContiner('Card balance', '100.000'),
                      // myItemContiner('Removable', '90.000'),
                      GestureDetector(
                        onTap: (){
                          Get.to(QRScanPage());
                        },
                        child: Column(
                          children: [
                            smallCardwithImage(
                                bgColour: AppColors.primaryColor,
                                isLoading: false,
                                imageUrl: "assets/pay_icon.png",
                                context: context,
                                function: () {
                                  print("paid tapped");

                                }),
                            SizedBox(
                              height: 10,
                            ),
                            labelWidget(
                                text: "Pay", myHeight: myHeight, myWidth: myWidth)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          walletCtrl.withdrawDialog(context);
                        },
                        child: Column(
                          children: [
                            smallCardwithImage(
                                bgColour: Colors.red,
                                isLoading: false,
                                imageUrl: "assets/withdraw_icon.png",
                                context: context,
                                function: () {}),
                            SizedBox(
                              height: 10,
                            ),
                            labelWidget(
                                text: "Withdraw",
                                myHeight: myHeight,
                                myWidth: myWidth)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          walletCtrl.depositDialog(context);
                        },
                        child: Column(
                          children: [
                            smallCardwithImage(
                                bgColour: Colors.green,
                                isLoading: false,
                                imageUrl: "assets/4.png",
                                context: context,
                                function: () {}),
                            SizedBox(
                              height: 10,
                            ),
                            labelWidget(
                                text: "Deposit",
                                myHeight: myHeight,
                                myWidth: myWidth)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          smallCardwithImage(
                              bgColour: Colors.orange,
                              isLoading: false,
                              imageUrl: "assets/1.png",
                              context: context,
                              function: () {}),
                          SizedBox(
                            height: 10,
                          ),
                          labelWidget(
                              text: "Voucher",
                              myHeight: myHeight,
                              myWidth: myWidth)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: myHeight * 0.02,
                      left: myWidth * 0.08,
                      right: myWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        'view all ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: myHeight * 0.01),
                              child: smallCardwithImage(
                                  bgColour: Colors.grey,
                                  isLoading: false,
                                  imageUrl: "assets/4.png",
                                  context: context,
                                  function: () {})),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rent Payment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: myHeight * 0.01),
                              Text(
                                'General expenses',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '04 Jun 2021 09.22 am',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: myHeight * 0.01),
                              Text(
                                '- 15,0000',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ))
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(QRScanPage());
          },
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            height: 0,
          ),
        ),
      ),
    );
  }
}
