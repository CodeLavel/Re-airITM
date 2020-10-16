import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterITM/pages/detail.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _outputController;

  // String code = "";
  // String getcode = "";

  Future _scanqr() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#009922", "CANCEL", true, ScanMode.QR)
        .then((String code) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Detail(code)));
    });
    // setState(() {
    //   code = getcode;
    // });
  }

  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('สแกนคิวอาร์โค้ด')),
      backgroundColor: Colors.grey[300],
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 180),
                    this._buttonGroup(),
                    SizedBox(height: 70),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 250,
            child: InkWell(
              onTap: _scanqr,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/images/qr.png'),
                    ),
                    Divider(height: 40),
                    Expanded(
                        flex: 0,
                        child: Text('Scan [QR Code]',
                            style: TextStyle(fontSize: 25))),
                    // Text(code),
                    Divider(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
  }
}
