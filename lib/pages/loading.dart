import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async { // データを取得する非同期メソッド
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.body);
  }

  @override
  void initState() { // 初期化メソッド(最初に呼び出されるメソッド)
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen"),
    );
  }
}
