import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:nawa/View/Pages/auth/auth_ctrl.dart';
import 'package:nawa/View/Pages/auth/forgot_password/forgot_password.dart';
import 'package:nawa/View/Pages/auth/signup.dart';

import '../../../widgets/globalwidgets.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = "/ResetPassword";

  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ResetPasswordState();
  }
}

class ResetPasswordState extends State<ResetPassword> {
  bool _isLoading = false;
  bool showResetForm = false;
  final GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  int? otp;

  final _isHidden = false.obs;

  Auth authCtrl = Get.put(Auth());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _fieldOne.dispose();
    _fieldTwo.dispose();
    _fieldThree.dispose();
    _fieldFour.dispose();
    _fieldFive.dispose();
    _fieldSix.dispose();
    passCtrl.dispose();
    confirmPassCtrl.dispose();
  }

  void resetPassword() {
    final isValid = resetPassFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    resetPassFormKey.currentState!.save();
    otp = int.parse(
        _fieldOne.text + _fieldTwo.text + _fieldThree.text + _fieldFour.text);
    authCtrl.resetPassword(otp!, passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.white,
                  height: 1.0,
                )),
            elevation: 4,
            toolbarHeight: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: IconButton(
                icon: const Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            title: const Text(
              'Reset Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            centerTitle: true),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 70, bottom: 10, left: 25, right: 25),
          child: showResetForm
              ? Form(
                  key: resetPassFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PasswordField(
                        isHidden: _isHidden,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your new Password';
                          }
                          if (value.length < 6) {
                            return 'Password must be 6 characters or more';
                          }
                          return null;
                        },
                        controller: passCtrl,
                        label: 'New Password',
                      ),
                      PasswordField(
                        isHidden: _isHidden,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your Password';
                          }
                          if (value != passCtrl.text) {
                            return 'Passwords do not Match!';
                          }

                          return null;
                        },
                        controller: confirmPassCtrl,
                        label: 'Confirm Password',
                      ),
                      PrimaryButton(
                        bgColor: AppColors.primaryColor..withOpacity(0.8),
                        txtColor: Colors.white,
                        label: 'Reset Password',
                        isLoading: _isLoading,
                        onPressed: () async {
                          if (!resetPassFormKey.currentState!.validate()) {
                            return;
                          }
                          setState(() {
                            _isLoading = true;
                          });
                          resetPassword();
                          await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            _isLoading = false;
                          });
                        },
                      ),
                    ],
                  ))
              : Form(
                  key: otpFormKey,
                  child: Column(
                    children: [
                      const Text(
                        "Enter the reset code sent to your email",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OTPField(controller: _fieldOne, context: context),
                              OTPField(controller: _fieldTwo, context: context),
                              OTPField(
                                  controller: _fieldThree, context: context),
                              OTPField(
                                  controller: _fieldFour, context: context),
                              OTPField(
                                  controller: _fieldFive, context: context),
                              OTPField(controller: _fieldSix, context: context),
                            ],
                          )),
                      PrimaryButton(
                        bgColor: AppColors.primaryColor..withOpacity(0.8),
                        txtColor: Colors.white,
                        label: 'Send Recovery Email',
                        isLoading: _isLoading,
                        onPressed: () async {
                          if (!otpFormKey.currentState!.validate()) {
                            return;
                          }
                          setState(() {
                            showResetForm = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
        ));
  }
}
