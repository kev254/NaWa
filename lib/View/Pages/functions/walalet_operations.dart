import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nawa/View/Pages/auth/forgot_password/reset_password.dart';
import 'package:nawa/View/Pages/auth/login.dart';
import 'package:nawa/View/widgets/globalwidgets.dart';
import 'package:http/http.dart' as http;
import 'package:nawa/utils/endpoints.dart';

import '../../BottomNavigationBar/navBar.dart';
import '../../themes/colors.dart';


class WalletCtrl with ChangeNotifier {
  WalletCtrl() {

  }
  get formHeader {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  showBusinessDetailsDialog(BuildContext context, String details) async {
    var detailsJson={"company_name": "Jambo", "account_number": "45671gsstswt92929", "amount": 600};
    print(detailsJson);
    String company_name=detailsJson['company_name'].toString();
    String amount=detailsJson['amount'].toString();
    String account_number=detailsJson['account_number'].toString();
    // print("scanned_amount"+detailsJson['amount'].toString());
    // print("scanned_amount"+detailsJson['account_number'].toString());
    // print("scanned_amount"+detailsJson['company_name'].toString());
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.scale,
      dialogBackgroundColor: AppColors.whiteColor,
      headerAnimationLoop: false,
      body: Center(
        child: Column(
          children: [
            Text(
              "Confirm action !",
              style: TextStyle(fontStyle: FontStyle.normal, color: AppColors.blackColor, fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Text(
              'Do you want to pay $company_name Ksh. $amount for acount number $account_number ?',
              style: TextStyle(fontStyle: FontStyle.normal, color: AppColors.blackColor),
            ),
          ],
        ),
      ),
      btnCancel: ElevatedButton(
        onPressed: () {
          // Handle cancel button press
          // withdrawDialog(context);
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set the button background color
        ),
        child: Text('Cancel'),
      ),
      btnOk: ElevatedButton(
        onPressed: () {
          // Handle accept button press
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the button background color
        ),
        child: Text('Accept'),
      ),
    )..show();


  }



  withdrawDialog(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.scale,
      dialogBackgroundColor: AppColors.whiteColor,
      headerAnimationLoop: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Withdraw Balance : 80,200", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
            customWalletField(
              label: 'Enter amount ',
              require: true,
              controller: amountController,
              height: myHeight,
              width: myHeight,
              type: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            )
          ],
        ),
      ),
      btnCancel: ElevatedButton(
        onPressed: () {
          // Handle cancel button press
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set the button background color
        ),
        child: Text('Cancel'),
      ),
      btnOk: ElevatedButton(
        onPressed: () {
          // Handle accept button press with the entered amount
          String enteredAmount = amountController.text;
          // You can now use the enteredAmount for further processing
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the button background color
        ),
        child: Text('Proceed'),
      ),
    )..show();
  }
  depositDialog(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.scale,
      dialogBackgroundColor: AppColors.whiteColor,
      headerAnimationLoop: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Deposit Balance : 80,200", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
            customWalletField(
              label: 'Enter amount ',
              require: true,
              controller: amountController,
              height: myHeight,
              width: myHeight,
              type: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            )
          ],
        ),
      ),
      btnCancel: ElevatedButton(
        onPressed: () {
          // Handle cancel button press
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set the button background color
        ),
        child: Text('Cancel'),
      ),
      btnOk: ElevatedButton(
        onPressed: () {
          // Handle accept button press with the entered amount
          String enteredAmount = amountController.text;
          // You can now use the enteredAmount for further processing
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the button background color
        ),
        child: Text('Proceed'),
      ),
    )..show();
  }
  inputBusinessDetails(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.scale,
      dialogBackgroundColor: AppColors.whiteColor,
      headerAnimationLoop: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Make Payment", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
            customWalletField(
              label: 'Business Name ',
              require: true,
              controller: amountController,
              height: myHeight,
              width: myHeight,
              type: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter business name';
                }
                return null;
              },
            ),
            customWalletField(
              label: 'Enter amount ',
              require: true,
              controller: amountController,
              height: myHeight,
              width: myHeight,
              type: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            )
          ],
        ),
      ),
      btnCancel: ElevatedButton(
        onPressed: () {
          // Handle cancel button press
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set the button background color
        ),
        child: Text('Cancel'),
      ),
      btnOk: ElevatedButton(
        onPressed: () {
          // Handle accept button press with the entered amount
          String enteredAmount = amountController.text;
          // You can now use the enteredAmount for further processing
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the button background color
        ),
        child: Text('Proceed'),
      ),
    )..show();
  }








}
