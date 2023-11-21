import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';
import 'generate_qr.dart';
import 'homePage.dart';

class WalleOperaionsPAge extends StatefulWidget {
  static const routeName = "/inventory";
  const WalleOperaionsPAge({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WalleOperaionsPAgeState createState() => _WalleOperaionsPAgeState();
}

class _WalleOperaionsPAgeState extends State<WalleOperaionsPAge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text("Wallet Operaions"), backgroundColor: AppColors.blackTextColor,),
        body: Container(
          height: myHeight,
          width: myWidth,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: SizedBox(
                height: double.maxFinite,
                child: navMenu(navItems: [
                  navItem(
                      iconPath: Icons.money,
                      label: 'Deposit',
                      goTo: ''),
                  navItem(
                      iconPath: Icons.money_off,
                      label: 'Withdraw',
                      goTo: ''),

                  navItem(
                      iconPath: Icons.send_to_mobile,
                      label: 'Make payment',
                      goTo: ''),

                  navItem(
                      iconPath: Icons.qr_code_2_sharp,
                      label: 'Generate QR',
                      goTo: QRImage("test")),

                  navItem(
                      iconPath: Icons.real_estate_agent_outlined,
                      label: 'Request Loan',
                      goTo: ''),



                ])),
          ),
        ));
  }
}