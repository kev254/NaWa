import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nawa/View/BottomNavigationBar/navBar.dart';

import 'View/themes/AppTheme.dart';
import 'View/Pages/homePage.dart';
import 'View/Pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:AppTheme.darkTheme,
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
