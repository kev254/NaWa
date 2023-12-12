import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nawa/View/Pages/functions/walalet_operations.dart';
import 'package:nawa/View/themes/colors.dart';
import '../widgets/globalwidgets.dart';
import 'transactionDetails.dart';

final walletCtrl = Get.put(WalletCtrl());

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final ImagePicker _picker = ImagePicker();
  String qrInfo = 'Scan a QR code';
  bool camState = false;
  @override
  void initState() {
    super.initState();
    camState = true;
  }

  String? _selectedTransactionType = "Select transaction type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make payment'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // Transaction Type Dropdown
          // Expanded(
          //   child: Container(
          //     padding: EdgeInsets.all(20),
          //     decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(20),
          //     ),
          //     alignment: Alignment.center,
          //     child: DropdownButton<String>(
          //       isExpanded: true,
          //       value: _selectedTransactionType,
          //       hint: Text(
          //         _selectedTransactionType!,
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onChanged: (String? newValue) {
          //         setState(() {
          //           _selectedTransactionType = newValue ?? 'Peer to Peer'; // Update the selected value, provide a default value if newValue is null
          //         });
          //       },
          //       items: ['Peer to Peer', 'Peer To Business', 'Business To Business', 'Business To Peer']
          //           .map<DropdownMenuItem<String>>((String value) {
          //         return DropdownMenuItem<String>(
          //           value: value,
          //           child: Text(
          //             value,
          //             style: TextStyle(color: Colors.black),
          //           ),
          //         );
          //       }).toList(),
          //       dropdownColor: Colors.white,
          //       iconEnabledColor: Colors.white, // Adjust the icon color to match the design
          //       iconSize: 24, // Adjust the icon size to match the design
          //       underline: Container(), // Remove the underline
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 5,
            child: camState
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, bottom: 30, left: 10, right: 10),
                    child: QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) {
                        if (code != null) {
                          setState(() {
                            print("Got_data: " + code);
                            qrInfo = '$code';
                            camState = false;
                            walletCtrl.showBusinessDetailsDialog(
                                context, qrInfo);
                          });
                        }
                      },
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      // Open the camera
                      captureImageWithCamera();
                    },
                    child: Center(
                      child: Text(
                        qrInfo,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
          ),
          // Text(qrInfo),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child:PrimaryButton(
          label: 'Enter Details',
              txtColor: AppColors.whiteColor,
              bgColor: AppColors.primaryColor,
              isLoading: false,
              onPressed: () {
                walletCtrl.selectAccountDialog(context);
              }
          )),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: PrimaryButton(
                    label: 'Upload QR',
                    txtColor: AppColors.whiteColor,
                    bgColor: AppColors.primaryColor,
                    isLoading: false,
                    onPressed: () {
                      pickImageFromGallery();
                    })),
          ]),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Future<void> captureImageWithCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        qrInfo = 'QR code captured';
        camState = false;
        // You can also handle the captured photo here
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        qrInfo = 'QR code selected from gallery';
        camState = false;
        // You can also handle the selected image here
      });
    }
  }
}
