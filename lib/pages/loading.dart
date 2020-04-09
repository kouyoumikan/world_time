import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async { // データを取得する非同期メソッド

    // make the response
    http.Response response = await http.get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(response.body);
    //print((data));

    // get properties from data
    String datetime = data["datetime"]; // 日付・時刻
    String offset = data["utc_offset"]; // オフセット
    print(datetime);
    print(offset);
  }

  @override
  void initState() { // 初期化メソッド(最初に呼び出されるメソッド)
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen"),
    );
  }
}
