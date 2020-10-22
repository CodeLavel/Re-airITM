import 'package:flutter/material.dart';
import 'package:flutterITM/pages/modelRepair.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListRepairPage extends StatefulWidget {
  ListRepairPage({Key key}) : super(key: key);

  @override
  _ListRepairPageState createState() => _ListRepairPageState();
}

class _ListRepairPageState extends State<ListRepairPage> {
  Repair repair;
  Future<Repair> getRepair() async {
    await http
        .get("http://192.168.1.10/FlutterITM/getrepair.php")
        .then((response) {
      if (jsonDecode(response.body) != null) {
        setState(() {
          repair = Repair.fromJson(jsonDecode(response.body));
        });
      }
    });
    return repair;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRepair();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('รายการแจ้งซ่อม'),
        ),
        body: ListView(children: <Widget>[
          DataTable(columns: [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('รหัสแจ้งซ่อม')),
            DataColumn(label: Text('รหัสพนักงาน')),
            DataColumn(label: Text('เลขครุภัณฑ์')),
            DataColumn(label: Text('สถานะ')),
            DataColumn(label: Text('วันที่แจ้ง')),
            DataColumn(label: Text('รายละเอียด')),
          ], rows: [
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                    "${repair.id}")), //Extracting from Map element the value
                DataCell(Text("${repair.rpCode}")),
                DataCell(Text("${repair.empCode}")),
                DataCell(Text("${repair.acID}")),
                DataCell(Text("${repair.rpStatus}")),
                DataCell(Text("${repair.rpDate}")),
                DataCell(Text("${repair.rpDetail}")),
              ],
            ),
          ]),
        ]));
  }
}
