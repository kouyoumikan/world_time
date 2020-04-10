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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () { // アイコンボタン押下時イベント
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location"),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text( // アプリ画面に取得したデータのlocation(場所)を表示
                    data["location"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text( // アプリ画面に取得したデータのtime(時間)を表示
                data["time"],
                style: TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

