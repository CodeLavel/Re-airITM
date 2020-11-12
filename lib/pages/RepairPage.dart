import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RepairPage extends StatefulWidget {
  RepairPage({Key key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  TextEditingController ac_code = TextEditingController();
  TextEditingController ac_detail = TextEditingController();

  String msg = '';

  Future<List> _repair() async {
    // final response = await http
    //     .post("http://192.168.1.71/FlutterRepairITM/login.php", body: {
    //   "ac_code": ac_code.text,
    //   "ac_detail": ac_detail.text,
    // });
    // // print(response.body);
    // var datauser = json.decode(response.body);
    // // print(datauser[0]['emp_fristname'] + '' + datauser[0]['emp_lastname']);
    // if (datauser.length == 0) {
    //   setState(() {
    //     msg = "Login Fail";
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
    print(ac_code.text);
    print(ac_detail.text);
  }

  //กำหนดตัวแปร
  String _accode, _acdetail;

  //สร้างคีย์เก็บสถานะ
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ระบบแจ้งซ่อม'),
        // automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          //ยกเลิกการโฟกัสช่อง input
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.teal),
                    controller: ac_code,
                    decoration: InputDecoration(
                        icon: Icon(Icons.supervised_user_circle),
                        labelText: 'เลขครุภัณฑ์'),
                    // initialValue: '400068',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'กรุณากรอเลขครุภัณฑ์';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (String value) {
                      setState(() {
                        this._accode = value;
                      });
                    },
                    onSaved: (value) {
                      this._accode = value.trim();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.teal),
                    controller: ac_detail,
                    decoration: InputDecoration(
                        icon: Icon(Icons.supervised_user_circle),
                        labelText: 'รายละเอียด'),
                    // initialValue: '400068',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'กรุณากรอกข้อมูล';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (String value) {
                      setState(() {
                        this._acdetail = value;
                      });
                    },
                    onSaved: (value) {
                      this._acdetail = value.trim();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        print(ac_code.text);
                        print(ac_detail);
                        _repair();
                      }
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
                  )
                ],
              )),
        ),
      ),
    );
  }
}
