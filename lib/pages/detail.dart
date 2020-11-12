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
  String acName, acCode, msg, acZone;
  Access access;

  Future<List> _repair() async {
    acName = "${access.acName}";
    acCode = "${access.code}";
    acZone = "${access.acZone}";

    print(acName);
    print(acCode);
    print(acZone);
    // final response = await http
    //     .post("http://192.168.1.71/FlutterRepairITM/postrepair.php", body: {
    //   "ac_code": acName,
    //   "ac_detail": acName,
    // });
    // // print(response.body);
    // var datauser = json.decode(response.body);
    // // print(datauser[0]['emp_fristname'] + '' + datauser[0]['emp_lastname']);
    // if (datauser.length == 0) {
    //   setState(() {
    //     msg = "แจ้งซ่อมไม่สำเร็จ";
    //   });
    // } else {
    //   if (datauser[0]['userlevel'] == 'Admin') {
    //     //สร้างตัวแปรแบบ SharedPreference
    //     Navigator.pushReplacementNamed(context, '/dashboard');
    //   } else if (datauser[0]['userlevel'] == 'Personnel') {
    //     //สร้างตัวแปรแบบ SharedPreference

    //     Navigator.pushReplacementNamed(context, '/dashboard');
    //   }
    // }
  }

  Future<Access> getAccess() async {
    await http
        .get(
            "http://192.168.1.71/FlutterITM/getaccess_qr.php?code=${widget.code}")
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/nsmlogo.png",
                        height: 100,
                      ),
                    ),
                    Text(
                      "เลขครุภัณฑ์ : ${access.code}",
                      style: TextStyle(fontSize: 20, height: 5),
                    ),
                    Text(
                      "ชื่อเลขครุภัณฑ์ : ${access.acName}",
                      style: TextStyle(fontSize: 20, height: 2),
                    ),
                    Text(
                      "โซน : ${access.acZone}",
                      style: TextStyle(fontSize: 20, height: 3),
                    ),
                    RaisedButton(
                      onPressed: () {
                        print("${access.acName}");
                        print("${access.code}");
                        print("${access.acZone}");
                        _repair();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'ยืนยันการแจ้งซ่อม',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
