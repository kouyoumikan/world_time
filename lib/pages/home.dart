import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; // マップのデータを設定

  @override
  Widget build(BuildContext context) {
    // マップのデータを取得し、更新する
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () { // アイコンボタン押下時イベント
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
            ),
          ],
        ),
      ),
    );
  }
}

