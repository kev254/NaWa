import 'package:flutter/material.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Profile"), backgroundColor: AppColors.blackColor,),
            body: Container(
              height: myHeight,
              width: myWidth,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: SizedBox(
                    height: double.maxFinite,
                    child: navMenu(navItems: [
                      smallCardwithImage(
                          bgColour: Colors.transparent,
                          isLoading: false,
                          imageUrl: "assets/user_icon.png",
                          context: context,
                          function: () {}),
                      navItem(
                          iconPath: Icons.settings,
                          label: 'General settings',
                          goTo: ''),
                      navItem(
                          iconPath: Icons.settings,
                          label: 'My usage',
                          goTo: ''),

                      navItem(
                          iconPath: Icons.settings,
                          label: 'My points',
                          goTo: ''),

                      navItem(
                          iconPath: Icons.settings,
                          label: 'Contact support',
                          goTo: ''),

                      navItem(
                          iconPath: Icons.logout,
                          label: 'Logout',
                          goTo: ''),



                    ])),
              ),
            ),
    ));
  }
}
