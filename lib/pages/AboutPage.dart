import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //สร้างตัวแปรไว้เก็บชื่อ
  String _fullname, _avatar, _status, _password;

  //สร้าง Oject sharepreference
  SharedPreferences sharedPreferences;

  getProfile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _fullname = sharedPreferences.getString('storeFristname');
      _avatar = sharedPreferences.getString('storeAvatar');
      _status = sharedPreferences.getString('storeStatus');
      _password = sharedPreferences.getString('storePassword');
    });
  }

  //ฟังก์ชันเช็ค Network เชื่อมต่อ
  checkNetwork() async {
    var reslut = await Connectivity().checkConnectivity();

    if (reslut == ConnectivityResult.wifi) {
      Fluttertoast.showToast(
          msg: "คุณกำลังเชื่อต่อผ่าน Wifi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (reslut == ConnectivityResult.mobile) {
      Fluttertoast.showToast(
          msg: "คุณกำลังเชื่อต่อผ่าน 4G",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (reslut == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: "คุณไม่ได้เชื่อต่อ Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  //ฟังก์ชันตอนเริ่มโหลด App
  @override
  void initState() {
    super.initState();
    getProfile();
    checkNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$_fullname',
                style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                  Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.0,
                      color: Colors.black)
                ]),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('ข้อมูลผู้ใช้ : $_fullname'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.satellite),
          title: Text('สถานะ : $_status'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('เปลี่ยนรหัสผ่าน : $_password'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('ตั้งค่าใช้งาน'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('ออกจากระบบ'),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'homestack/login');
          },
        ),
      ],
    ));
  }
}
