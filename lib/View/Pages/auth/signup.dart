import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:nawa/View/Pages/auth/auth_ctrl.dart';
import '../../widgets/globalwidgets.dart';
import 'login.dart';

final authCtrl = Get.put(Auth());

class SignUp extends StatefulWidget {
  static const routeName = "/signup";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _isHidden = false.obs;
  bool _isLoading = false;

  bool isValidPhone(String s) {
    return (s.length > 9 || s.length < 16);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passCtrl.dispose();
    confirmPassCtrl.dispose();
    super.dispose();
  }

  void authSignup() {
    List userData = [
      firstNameCtrl.text,
      lastNameCtrl.text,
      emailCtrl.text,
      phoneCtrl.text,
      passCtrl.text,
    ];
    authCtrl.signUp(userData);
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/4.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                      color: AppColors.primaryColor,
                    ),
                    labelWidget(
                        text: "NaWa", myHeight: myHeight, myWidth: myWidth)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customFormField(
                              height:myHeight ,
                              width: myWidth,
                              label: 'Name',
                              require: true,
                              controller: firstNameCtrl,
                              type: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              }),
                          customFormField(
                            height: myWidth,
                              width: myWidth,
                              label: 'LastName',
                              require: true,
                              controller: lastNameCtrl,
                              type: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              }),
                          customFormField(
                            height: myHeight,
                              width: myWidth,
                              label: 'Email',
                              require: true,
                              controller: emailCtrl,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (!GetUtils.isEmail(value!)) {
                                  return 'Please enter a Valid email';
                                }
                                return null;
                              }),
                          customFormField(
                            height: myHeight,
                              width: myWidth,
                              label: 'Phone Number',
                              require: true,
                              controller: phoneCtrl,
                              type: TextInputType.phone,
                              validator: (value) {
                                if (!isValidPhone(value!)) {
                                  return 'Please enter a valid phone Number';
                                }
                                return null;
                              }),
                          PasswordField(
                            isHidden: _isHidden,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Password';
                              }
                              if (value.length < 6) {
                                return 'Password must be 6 characters or more';
                              }
                              return null;
                            },
                            controller: passCtrl,
                            label: 'Password',
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
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    imageButton(
                      txtColour: AppColors.whiteColor,
                      bgColour: AppColors.primaryColor,
                      isLoading: _isLoading,
                      icon: Icon(Icons.arrow_forward),
                      function: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          authSignup();
                        }
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _isLoading = false;
                        });
                      },
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextSpanWidget(
                      mainLabel: "Already have an account? ",
                      childLabel: 'Log In',
                      function: () {
                        Get.toNamed(Login.routeName);
                      }),
                )
              ])),
    );
  }
}
