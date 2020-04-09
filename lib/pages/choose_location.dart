import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async { // データを取得する非同期メソッド

    // simulate network request for a username
    // (ユーザー名を取得し、ネットワーク要求をシュミレートする)
    Future.delayed(Duration(seconds: 3), () { // 3秒後、コールバックメソッド起動する
      print("yoshi");
    });

    // simulate network request to get bio of the username
    // (ユーザー名の略歴を取得し、ネットワーク要求をシュミレートする)
    Future.delayed(Duration(seconds: 2), () { // 2秒後、コールバックメソッド起動する
      print("vegan, musician & egg collector"); // 伝記、ミュージシャンと卵コレクター
    });

    print("statement");
  }

  @override
  void initState() { // 初期化メソッド(最初に呼び出されるメソッド)
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("build  function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( // アプリバーのデザイン
        backgroundColor: Colors.blue[900],
        title: Text("choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
//            counter += 1;
          });
        },
//        child: Text("counter ie $counter"),
      ),
    );
  }
}
