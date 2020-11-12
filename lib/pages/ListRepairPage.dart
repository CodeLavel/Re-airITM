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
  var respondList = null;
  Repair repair;
  //List<Repair> repairList = new List<Repair>();
  List<DataRow> listRow = new List<DataRow>();
  Future<List<DataRow>> getRepair() async {
    await http
        .get("http://192.168.1.71/FlutterITM/getrepair.php")
        .then((response) {
      if (jsonDecode(response.body) != null) {
        setState(() {
          respondList = jsonDecode(response.body)["data"];
          for (var i = 0; i < respondList.length; i++) {
            repair = Repair.fromJson(respondList[i]);
            listRow.add(DataRow(
              cells: <DataCell>[
                DataCell(Text(
                    "${repair.id}")), //Extracting from Map element the value
                DataCell(Text("${repair.rpCode}")),
                DataCell(Text("${repair.acID}")),
                DataCell(Text("${repair.rpStatus}")),
              ],
            ));
            //repairList.add(repair);
          }
        });
      }
    });
    return listRow;
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
          DataTable(
              columns: [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('รหัสแจ้งซ่อม')),
                DataColumn(label: Text('เลขครุภัณฑ์')),
                DataColumn(label: Text('สถานะ')),
              ],
              rows:
                  listRow /*[
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                    "${repairList[0].id}")), //Extracting from Map element the value
                DataCell(Text("${repairList[0].rpCode}")),
                DataCell(Text("${repairList[0].empCode}")),
                DataCell(Text("${repairList[0].acID}")),
                DataCell(Text("${repairList[0].rpStatus}")),
                DataCell(Text("${repairList[0].rpDate}")),
                DataCell(Text("${repairList[0].rpDetail}")),
              ],
            ),
          ]*/
              ),
        ]));
  }
}
