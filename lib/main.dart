import 'package:flutter/material.dart';
import 'package:jp/pages/home.dart';
import 'package:jp/pages/choose_location.dart';
import 'package:jp/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/", // アプリを開いた時にロードする最初のルート
  routes: {
    "/": (context) => Loading(), // ロード画面
    "/home": (context) => Home(), // ホーム画面
    "/location": (context) => ChooseLocation(), // 位置、場所
  },
));

