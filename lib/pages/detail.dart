import 'dart:convert';
import 'package:flutterITM/pages/modelAccess.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final String code;
  Detail(this.code);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Access access;
  Future<Access> getAccess() async {
    await http
        .get(
            "http://192.168.1.10/FlutterITM/getaccess_qr.php?code=${widget.code}")
        .then((response) {
      if (jsonDecode(response.body) != null) {
        setState(() {
          access = Access.fromJson(jsonDecode(response.body));
        });
      }
    });
    return access;
  }

  @override
  void initState() {
    getAccess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แจ้งซ่อม')),
      body: Center(
        child: access == null
            ? Text(
                'Test QR Code Scan, ${widget.code}',
                style: TextStyle(fontSize: 20),
              )
            : Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Code : ${access.code}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Access Name : ${access.acName}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
