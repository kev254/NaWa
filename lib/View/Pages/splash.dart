import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/BottomNavigationBar/navBar.dart';
import 'package:nawa/View/Pages/auth/login.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Timer(
    //   Duration(seconds: 4),
    //   () {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => Login()));
    //   },
    // );
    super.initState();
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    labelWidget(
                        text: "NaWa", myHeight: myHeight, myWidth: myWidth)
                  ],
                ),
                Image.asset(
                  'assets/banner.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,

                ),

                Text(
                  'Welcome to  NaWa Wallet',
                  style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Text(
                //     'For instant deposits, withrawal and purchase we be your best solution',
                //     style: TextStyle(
                //         fontSize: 16,
                //         color: Colors.white,
                //         fontWeight: FontWeight.normal),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: imageButton(
                        txtColour: AppColors.whiteColor,
                        bgColour: AppColors.primaryColor,
                        isLoading: false,
                        icon: Icon(Icons.arrow_forward),
                        function: () async {
                          Get.to(Login());
                        },
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
