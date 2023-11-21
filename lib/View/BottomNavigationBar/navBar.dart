import 'package:flutter/material.dart';
import 'package:nawa/View/Pages/cartPage.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:nawa/View/Pages/historyPage.dart';
import 'package:nawa/View/Pages/homePage.dart';
import 'package:nawa/View/Pages/profilePage.dart';

import '../Pages/setup.dart';
import '../Pages/wallet_oeperation.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  static List<Widget> pages = [
    HomePage(),
    CartPage(),
    WalleOperaionsPAge(),
    SetupPage()
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
          body: pages.elementAt(index),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.blackColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/3.png',
                    height: myHeight * 0.03,
                    color: Colors.grey.shade300,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/3.png',
                    height: myHeight * 0.03,
                    color: Color(0xff7847FC),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/5.png',
                    height: myHeight * 0.03,
                    color: Colors.grey.shade300,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/5.png',
                    height: myHeight * 0.03,
                    color: Color(0xff7847FC),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/4.png',
                    height: myHeight * 0.03,
                    color: Colors.grey.shade300,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/4.png',
                    height: myHeight * 0.03,
                    color: Color(0xff7847FC),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/6.png',
                    height: myHeight * 0.03,
                    color: Colors.grey.shade300,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/6.png',
                    height: myHeight * 0.03,
                    color: Color(0xff7847FC),
                  ),
                ),
              ])),
    );
  }
}
