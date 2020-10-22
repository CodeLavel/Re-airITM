import 'package:flutter/material.dart';
import 'package:flutterITM/pages/AboutPage.dart';
import 'package:flutterITM/pages/HomePage.dart';
import 'package:flutterITM/pages/ListRepairPage.dart';
import 'package:flutterITM/pages/QrScanPage.dart';
import 'package:flutterITM/pages/RepairPage.dart';

class HomeStack extends StatefulWidget {
  HomeStack({Key key}) : super(key: key);

  @override
  _HomeStackState createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext _) => HomePage();
            break;
          case 'homestack/listrepair':
            builder = (BuildContext _) => ListRepairPage();
            break;
          case 'homestack/repair':
            builder = (BuildContext _) => RepairPage();
            break;
          case 'homestack/qrscan':
            builder = (BuildContext _) => QRScanPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
