import 'package:flutter/material.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';
import 'expenses.dart';
import 'income.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Setup"), backgroundColor: AppColors.blackColor,),
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
                        label: 'Setup income sources',
                        goTo: IncomePage()),
                    navItem(
                        iconPath: Icons.money_off,
                        label: 'Setup expense sources',
                        goTo: ExpensesPage()),



                  ])),
            ),
          ),
        ));
  }
}
