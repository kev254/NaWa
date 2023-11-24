import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:nawa/View/Pages/auth/auth_ctrl.dart';
import 'package:nawa/View/Pages/auth/forgot_password/forgot_password.dart';
import 'package:nawa/View/Pages/auth/signup.dart';

import '../widgets/globalwidgets.dart';
final authCtrl = Get.put(Auth());

class AddIncomePage extends StatefulWidget {
  static const routeName = "/expensenew";

  const AddIncomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddIncomePageState();
  }
}

class AddIncomePageState extends State<AddIncomePage> {
  final _isHidden = false.obs;
  bool _isLoading = false;
  late TextEditingController emailCtrl, passCtrl;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
    passCtrl = TextEditingController();
    setState(() {});
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  authSignIn() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    authCtrl.signIn(emailCtrl.text, passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(title: Text("Income category"), backgroundColor: AppColors.blackColor,),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Form(
                        key: loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            const SizedBox(
                              height: 3,
                            ),
                            customFormField(
                              label: 'Source name',
                              require: true,
                              controller: emailCtrl,
                              height: myHeight,
                              width: myHeight,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter name';
                                }
                                return null;
                              },
                            ),
                                                     ],
                        )),
                  ),
                  PrimaryButton(
                    bgColor: AppColors.primaryColor.withOpacity(0.8),
                    txtColor: Colors.white,
                    label: 'Save income source',
                    isLoading: _isLoading,
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      // authSignIn();

                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     imageButton(
                  //       txtColour: AppColors.whiteColor,
                  //       bgColour: AppColors.primaryColor,
                  //       isLoading: _isLoading,
                  //       icon: Icon(Icons.arrow_forward),
                  //       function: () async {
                  //         setState(() {
                  //           _isLoading = true;
                  //         });
                  //         authSignIn();
                  //
                  //         await Future.delayed(const Duration(seconds: 2));
                  //         setState(() {
                  //           _isLoading = false;
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.only(top: 0),
                      width: 255,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  // TextSpanWidget(
                  //     mainLabel: "Don't have an account? ",
                  //     childLabel: 'Register',
                  //     function: () {
                  //       Get.to(SignUp());
                  //     })
                ])
            // ])
            ));
  }
}
