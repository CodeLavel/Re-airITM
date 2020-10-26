import 'package:flutter/material.dart';
import 'package:flutterITM/pages/HomeStack.dart';
import 'package:flutterITM/pages/Login.dart';
import 'package:flutterITM/pages/WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Repair ITM',
      theme: ThemeData(
        primaryColor: Color(0xFFBBDEFB),
        accentColor: Color(0xFFBBDEFB),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: HomePage(),
      initialRoute: '/Welcome',
      routes: {
        '/': (context) => LoginPage(),
        '/HomeStack': (context) => HomeStack(),
        '/Welcome': (context) => WelcomePage(),
      },
    );
  }
}
