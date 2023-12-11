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
  String _selectedOption = 'bank';
  String withdrawalOption = 'own'; // default to 'own'

  String get selectedOption => _selectedOption;
  set selectedOption(String newValue) {
    if (_selectedOption != newValue) {
      _selectedOption = newValue;
      notifyListeners(); // This will notify all the listening widgets to rebuild
    }
  }

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



  void withdrawDialog(BuildContext context) {
  TextEditingController amountController = TextEditingController();
  TextEditingController numberController = TextEditingController(); // Controller for the other number input
  double myHeight = MediaQuery.of(context).size.height;

  String localWithdrawalOption = withdrawalOption; // Local variable for withdrawal options
  
  AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.scale,
    dialogBackgroundColor: AppColors.whiteColor,
    headerAnimationLoop: false,
    body: StatefulBuilder( // Use StatefulBuilder to manage the local state
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To prevent unnecessary space
            children: [
              Text(
                "Withdraw Balance : 80,200",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              // Your customWalletField widget for the amount
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
              ),
              RadioListTile<String>(
                title: const Text('To own number'),
                value: 'own',
                groupValue: localWithdrawalOption,
                onChanged: (value) {
                  setState(() {
                    localWithdrawalOption = value!;
                    withdrawalOption = value; // Update the class-level withdrawal option
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('To other number'),
                value: 'other',
                groupValue: localWithdrawalOption,
                onChanged: (value) {
                  setState(() {
                    localWithdrawalOption = value!;
                    withdrawalOption = value; // Update the class-level withdrawal option
                  });
                },
              ),
              // Conditionally display the TextField for other number
              if (localWithdrawalOption == 'other')
                TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: 'Enter other number',
                    // Add other decoration properties if needed
                  ),
                  keyboardType: TextInputType.phone,
                  // Add other TextField properties if needed
                ),
            ],
          ),
        );
      },
    ),
    btnCancel: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      child: const Text('Cancel'),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        String enteredAmount = amountController.text;
        // Optional: Validate the other number input if "To other number" is selected
        if (localWithdrawalOption == 'other' && numberController.text.isEmpty) {
          // Show an error or handle the validation failure
        } else {
          // Use the enteredAmount and withdrawalOption for further processing
          // If "To other number" is selected, use numberController.text as well
          Navigator.of(context).pop(); // Close the dialog
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
      child: const Text('Proceed'),
    ),
  )..show();
}



void depositDialog(BuildContext context) {
  TextEditingController amountController = TextEditingController();
  double myWidth = MediaQuery.of(context).size.width;
  double myHeight = MediaQuery.of(context).size.height;
  String localSelectedOption = _selectedOption; // Create a local variable for the selected option

  AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.scale,
    dialogBackgroundColor: AppColors.whiteColor,
    headerAnimationLoop: false,
    body: StatefulBuilder( // Use StatefulBuilder to create local state
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Deposit Balance : 80,200",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
              ),
              RadioListTile<String>(
                title: const Text('From Bank'),
                value: 'bank',
                groupValue: localSelectedOption,
                onChanged: (value) {
                  setState(() { // Call the local setState provided by StatefulBuilder
                    localSelectedOption = value!;
                    _selectedOption = value; // Update the class-level selected option
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('From Mobile Money (Mpesa)'),
                value: 'mpesa',
                groupValue: localSelectedOption,
                onChanged: (value) {
                  setState(() { // Call the local setState provided by StatefulBuilder
                    localSelectedOption = value!;
                    _selectedOption = value; // Update the class-level selected option
                  });
                },
              ),
            ],
          ),
        );
      },
    ),
    btnCancel: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      child: Text('Cancel'),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        String enteredAmount = amountController.text;
        // Handle accept button press with the entered amount and selected option
        // Use _selectedOption for further processing
        Navigator.of(context).pop(); // Close the dialog
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
      child: Text('Proceed'),
    ),
  )..show();
}


  inputBusinessDetails(BuildContext context) {
    TextEditingController businessNameController = TextEditingController();
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
              controller: businessNameController, // Use businessNameController here
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
              controller: amountController, // Use amountController here
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
