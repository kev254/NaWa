import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/Pages/qrScan.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:get/get.dart';

import '../widgets/globalwidgets.dart';
import 'qrScan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                homebigCard(
                    myWidth: myWidth, myHeight: myHeight, context: context),
                Padding(
                  padding: EdgeInsets.only(
                      top: myHeight * 0.02,
                      left: myWidth * 0.08,
                      right: myWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fuetured ',
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
                      Column(
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
                      Column(
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
      ),
    );
  }
}
