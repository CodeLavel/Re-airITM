import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController emp_code = TextEditingController();
  TextEditingController password = TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.1.71/FlutterITM/login.php", body: {
      "emp_code": emp_code.text,
      "password": password.text,
    });
    // print(response.body);
    var datauser = json.decode(response.body);

    if (datauser == "Success") {
      await FlutterSession().set('token', emp_code.text);
    }
    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['userlevel'] == 'Admin') {
        //สร้างตัวแปรแบบ SharedPreference
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        //เก็บค่าลงตัวแปรแบบ SharedPreference
        sharedPreferences.setInt('appStep', 2);
        sharedPreferences.setString('storeFristname',
            datauser[0]['emp_fristname'] + ' ' + datauser[0]['emp_lastname']);
        sharedPreferences.setString('storeStatus', datauser[0]['userlevel']);
        sharedPreferences.setString('storePassword', datauser[0]['password']);
        sharedPreferences.setString('storeAvatar', datauser[0]['emp_img']);
        Navigator.pushReplacementNamed(context, '/HomeStack');
      } else if (datauser[0]['userlevel'] == 'Personnel') {
        //สร้างตัวแปรแบบ SharedPreference
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        //เก็บค่าลงตัวแปรแบบ SharedPreference
        sharedPreferences.setInt('appStep', 2);
        sharedPreferences.setString('storeFristname',
            datauser[0]['emp_fristname'] + ' ' + datauser[0]['emp_lastname']);
        sharedPreferences.setString('storeStatus', datauser[0]['userlevel']);
        sharedPreferences.setString('storePassword', datauser[0]['password']);
        sharedPreferences.setString('storeAvatar', datauser[0]['emp_img']);
        Navigator.pushReplacementNamed(context, '/HomeStack');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ระบบแจ้งซ่อม'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'ล็อคอินเข้าสู่ระบบ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Text(
                  msg,
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emp_code,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'รหัสพนักงาน',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'รหัสผ่าน',
                    ),
                  ),
                ),
                Container(
                    height: 80,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child:
                          Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 30)),
                      onPressed: () {
                        print(emp_code.text);
                        print(password.text);
                        _login();
                      },
                    )),
              ],
            )));
  }
}
