import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  var qrInfo = null;
  bool camState = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    camState = true;

  }

  void onQRCodeScanned(String code) {
    setState(() {
      camState = false;
      qrInfo = code;
      // You can also navigate to another page or perform any actions with the scanned code here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transact'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('SELECT TRANSACTION TYPE', style: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  // Handle transaction type change
                },
                items: ["Peer to peer", 'Peer to Business', 'Business to peer', 'Business to business']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
                dropdownColor: Colors.white,
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
                     // onQRCodeScanned(code);
                      setState(() {
                        qrInfo=code;

                      });
                      print(qrInfo);
                    },
                  )
                : Center(
                    child: Text(
                      qrInfo,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  camState = true;
                });
              },
              child: Text('Authorize transaction'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
