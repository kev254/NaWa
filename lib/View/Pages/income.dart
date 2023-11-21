import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/Pages/qrScan.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';
import 'add_expens.dart';
import 'add_income.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
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

                SizedBox(
                  height: myHeight * 0.04,
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
                        'Source List ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          Get.to(AddIncomePage());
                          // Add the action you want to perform when the icon button is pressed
                        },
                      )

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
                                      imageUrl: "assets/logo.png",
                                      context: context,
                                      function: () {})),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sales ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: myHeight * 0.01),
                                  Text(
                                    '',
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
                                    '5,000',
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

      ),
    );
  }
}
