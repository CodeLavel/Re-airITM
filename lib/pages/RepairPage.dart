import 'package:flutter/material.dart';

class RepairPage extends StatefulWidget {
  RepairPage({Key key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('หน้าแจ้งซ่อม')),
      body: Center(
          child: Column(
        children: <Widget>[Text('Codelavel thailand 404')],
      )),
    );
  }
}
