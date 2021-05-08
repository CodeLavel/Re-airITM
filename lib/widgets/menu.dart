import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ยินดีต้อนรับ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
                // future: FlutterSession().get('token'),
                builder: (context, snapshot) {
              return Text(
                  snapshot.hasData ? snapshot.data.toString() : 'Loading....');
            }),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('หน้าหลัก'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('แจ้งซ่อม'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('รายการแจ้งซ่อม'),
            ),
          ],
        ),
      ),
    );
  }
}
