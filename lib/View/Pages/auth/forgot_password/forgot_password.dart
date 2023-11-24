import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:nawa/View/Pages/auth/auth_ctrl.dart';
import 'package:nawa/View/Pages/auth/forgot_password/forgot_password.dart';
import 'package:nawa/View/Pages/auth/signup.dart';

import '../../../widgets/globalwidgets.dart';
class ForgotPassword extends StatefulWidget {
  static const routeName = "/ForgotPassword";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;
  late TextEditingController emailCtrl;
  final GlobalKey<FormState> forgotPassFormKey = GlobalKey<FormState>();

  Auth authCtrl = Get.put(Auth());

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  void sendRecovery() {
    final isValid = forgotPassFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgotPassFormKey.currentState!.save();
    authCtrl.sendRecoveryEmail(emailCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
          elevation: 4,
          toolbarHeight: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          title: const Text(
            'Forgot Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          centerTitle: true),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, left: 25, right: 25),
        child: Form(
            key: forgotPassFormKey,
            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 25),
                    child: Text(
                      "Don't worry, it happens to the best of us",
                      textAlign: TextAlign.center,style: TextStyle(color: AppColors.whiteColor),
                    )),
                customFormField(
                  height: myHeight,
                  width: myWidth,
                  label: 'Email Address',
                  require: true,
                  controller: emailCtrl,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                PrimaryButton(
                  bgColor: AppColors.primaryColor..withOpacity(0.8),
                  txtColor: Colors.white,
                  label: 'Send Recovery Email',
                  isLoading: _isLoading,
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    sendRecovery();
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      _isLoading = false;
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
