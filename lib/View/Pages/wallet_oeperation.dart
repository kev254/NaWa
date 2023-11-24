import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/Pages/qrScan.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';
import 'functions/walalet_operations.dart';
import 'generate_qr.dart';
import 'homePage.dart';
final walletCtrl = Get.put(WalletCtrl());

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
                  WalletnavItem(
                      iconPath: Icons.money,
                      label: 'Deposit',
                      function: (){
                        walletCtrl.depositDialog(context);
                      }),
                  WalletnavItem(
                      iconPath: Icons.money_off,
                      label: 'Withdraw',
                      function: (){
                        walletCtrl.withdrawDialog(context);
                      }),

                  WalletnavItem(
                      iconPath: Icons.send_to_mobile,
                      label: 'Make payment',
                      function: (){
                        Get.to(QRScanPage());
                      }),

                  WalletnavItem(
                      iconPath: Icons.qr_code_2_sharp,
                      label: 'Generate QR',
                      function: (){
                        Get.to(QRImage("{company_name: Jambo, account_number: 45671gsstswt92929, amount: 600,}"));
                      }
                  ),

                  WalletnavItem(
                      iconPath: Icons.real_estate_agent_outlined,
                      label: 'Request Loan',
                      function: (){
                        Navigator.pop(context);
                      }),



                ])),
          ),
        ));
  }
}