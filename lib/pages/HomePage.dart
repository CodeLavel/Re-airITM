import 'package:flutter/material.dart';
import 'package:flutterITM/widgets/logo.dart';
import 'package:flutterITM/widgets/menu.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        centerTitle: true,
        title: const Logo(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CodeLavel Thailand',
            ),
            RaisedButton(
              child: Text('เกี่ยวกับ'),
              onPressed: () async {
                await Navigator.pushNamed(context, 'homestack/about');
              },
            )
          ],
        ),
      ),
    );
  }
}
