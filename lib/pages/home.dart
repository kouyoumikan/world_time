import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; // マップのデータを設定

  @override
  Widget build(BuildContext context) {
    // データが空でないか確認する
    // マップのデータを取得し、更新する
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // set background(昼間か夜間の背景画像を設定)
    String bgImage = data["isDaytime"] ? "day.jpeg" : "night.jpeg";
    Color bgColor = data["isDaytime"] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor, // アプリバー上の色を設定
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration( // 背景画像の設定
        image: DecorationImage( // アプリ画面全体に画像を配置
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover, // アプリ画面全体をカバーする
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async { // アイコンボタン押下時イベント
                      dynamic result = await  Navigator.pushNamed(context, "/location");
                      setState(() { // 取得していたデータを上書きし、更新する
                        data = {
                          "time": result["time"],
                          "location": result["location"],
                          "isDaytime": result["isDaytime"],
                          "flag": result["flag"],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text( // アプリ画面に取得したデータのtime(時間)を表示
                  data["time"],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

