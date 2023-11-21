import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:image_picker/image_picker.dart';

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
    // TODO: implement initState
    super.initState();
    camState = true;

  }
  String? _selectedTransactionType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transact'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // Transaction Type Dropdown
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              color: Colors.black, 
              borderRadius: BorderRadius.circular(20), 
              ),
              alignment: Alignment.center,
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedTransactionType,
                hint: Text(
                  'SELECT TRANSACTION TYPE', 
                  style: TextStyle(color: Colors.grey),),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTransactionType = newValue; // Update the selected value
                  });
                },
                items: ['Peer to Peer', 'Peer To Business', 'Business To Business', 'Business To Peer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value, 
                      style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.white, // Adjust the icon color to match the design
                iconSize: 24, // Adjust the icon size to match the design
                underline: Container(), // Remove the underline
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: camState
                ? QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      // Handle QR code scanned
                    },
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

          // Button to pick an image from gallery
          ElevatedButton(
            onPressed: () {
              pickImageFromGallery();
            },
            child: Text('Pick QR Code from Gallery'),
          ),

          // Button to handle 'Can't scan the QR code'
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionDetails()),
              );
            },
            child: Text("Can't scan the QR code"),
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

class TransactionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Center(
        child: Text('Transaction Details Page'),
      ),
    );
  }
}