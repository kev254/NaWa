import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nawa/View/Pages/auth/forgot_password/reset_password.dart';
import 'package:nawa/View/Pages/auth/login.dart';
import 'package:nawa/View/widgets/globalwidgets.dart';
import 'package:http/http.dart' as http;
import 'package:nawa/utils/endpoints.dart';

import '../../BottomNavigationBar/navBar.dart';


class Auth with ChangeNotifier {
  Auth() {
    debugPrint("#################");
    debugPrint("##### AUTH ######");
    debugPrint("#################");

    // getStorageToken();
  }
  get formHeader {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  signUp(List userData) async {
    var body = {
      'first_name': userData[0],
      'last_name': userData[1],
      'email': userData[2],
      'phone': userData[3],
      'password': userData[4]
    };
    print(body);

    showSnackbar(
        path: Icons.check_rounded,
        title: "Successful Sign Up!",
        subtitle: "Welcome to NaWa");
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => Login());
    notifyListeners();
    return;

    // try {
    //   print(signupURL);
    //   var res =
    //   await http.post(Uri.parse(signupURL), body: body, headers: formHeader);
    //   print(res.body);
    //   var resData=jsonDecode(res.body);
    //   // storeBranchId(branchId);
    //
    //   if (resData['success']) {
    //
    //     showSnackbar(
    //         path: Icons.check_rounded,
    //         title: "Successful Sign Up!",
    //         subtitle: "Welcome to World Vain");
    //     await Future.delayed(const Duration(seconds: 2));
    //     Get.off(() => Login());
    //     notifyListeners();
    //     return;
    //   }
    //   return;
    // } catch (error) {
    //   debugPrint('got_error: $error');
    //   showSnackbar(
    //       path: Icons.close_rounded,
    //       title: "Failed Sign Up!",
    //       subtitle: "Please check your internet connection or try again later");
    // }
  }



  signIn(String email, String password) async {
    var body = {
      "email": email,
      "password": password,
    };
    print(body);
    showSnackbar(
        path: Icons.check_rounded,
        title: "Successful Sign In!",
        subtitle: "Welcome Back");
    await Future.delayed(const Duration(seconds: 1));
    Get.off(() =>
        NavBar());
    notifyListeners();
    return;


    // try {
    //   print(loginURL);
    //   var res =
    //   await http.post(Uri.parse(loginURL), body: body, headers: formHeader);
    //   // print(res.body);
    //   var resData = jsonDecode(res.body);
    //   // storeUserData(branchId);
    //
    //   if (resData['success']) {
    //     print(resData['user']);
    //     storeUserData(resData['user']);
    //     print(resData['user']['first_name']);
    //     // localUserID=resData['user']['id'].toString();
    //     // localUserName=resData['user']['first_name'].toString();
    //     showSnackbar(
    //         path: Icons.check_rounded,
    //         title: "Successful Sign In!",
    //         subtitle: "Welcome Back");
    //     await Future.delayed(const Duration(seconds: 1));
    //     Get.off(() =>
    //         NavBar());
    //     notifyListeners();
    //     return;
    //   }
    //   return;
    // } catch (error) {
    //   debugPrint('got_error: $error');
    //   showSnackbar(
    //       path: Icons.close_rounded,
    //       title: "Failed to login!",
    //       subtitle: "Please check your internet connection or try again later");
    // }
  }



  sendRecoveryEmail(String email) async {
    var body = json.encode({"email": email});
    debugPrint(body);

    showSnackbar(
        path: Icons.check_rounded,
        title: "Recovery email sent",
        subtitle: "Please check your email for a reset code");
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const ResetPassword());
  }

  resetPassword(int otp, String password) async {
    var body = json.encode({"reset_code": otp, "new_password": password});
    debugPrint(body);

    showSnackbar(
        path: Icons.check_rounded,
        title: "Password Reset",
        subtitle: "Redirecting to Log In");
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const Login());
  }

  Future<bool> logout() async {
    debugPrint("Logging out");
    await clearStorage();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Login.routeName);
    return true;
  }

  Future<bool> clearStorage() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<void> storeUserData(Map<String, dynamic> data) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final dataJson = jsonEncode(data);
    await sharedPreferences.setString('user', dataJson);
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user  = prefs.getString('user');
    return jsonDecode(user!);
  }

}
