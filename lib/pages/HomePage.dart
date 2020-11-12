import 'package:flutter/material.dart';
import 'package:flutterITM/pages/AboutPage.dart';
import 'package:flutterITM/pages/FirstPage.dart';
import 'package:flutterITM/pages/ListRepairPage.dart';
import 'package:flutterITM/pages/QrScanPage.dart';
import 'package:flutterITM/pages/notificationPage.dart';
import 'package:flutterITM/widgets/logo.dart';
import 'package:flutterITM/widgets/menu.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  final List<Widget> _children = [
    ListRepairPage(),
    QRScanPage(),
    FirstPage(),
    NotificationPage(),
    AboutPage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  var indexpages = [
    "แจ้งซ่อม",
    "รายการแจ้งซ่อม",
    "ข้อมูลโซน",
    "สแกน QR Code",
  ];
  var images = [
    "assets/images/menu_icon/repair.png",
    "assets/images/menu_icon/list.png",
    "assets/images/menu_icon/house.png",
    "assets/images/menu_icon/qrcode.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Menu(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Logo(),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        height: 60,
        animationDuration: Duration(microseconds: 200),
        index: 2,
        animationCurve: Curves.bounceInOut,
        items: [
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.check,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.inbox,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: onTabTapped,
      ),
      body: _children[_currentIndex],
    );
  }
}
