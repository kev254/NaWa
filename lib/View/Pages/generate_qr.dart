import 'package:flutter/material.dart';
import 'package:nawa/View/themes/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  QRImage(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: const Text('Scan or share this QR'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Center(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white, // Set the color you want for the QR code
              BlendMode.srcIn,
            ),
            child: QrImageView(
              data: data,
              size: 280,
              embeddedImage: AssetImage('assets/logo.png'), // Replace with your image asset path
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(60, 60), // Adjust the size of the embedded image
              ),
            ),
          ),
        ),
      ),
    );
  }
}