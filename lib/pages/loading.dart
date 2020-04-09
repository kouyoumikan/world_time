import 'package:flutter/material.dart';
import 'package:jp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // WorldTimeクラスの新しいインスタンスを作成
  void setupWorldTime() async {  // データを取得する同期メソッド
    // WorldTimeインスタンス(場所フラグとURL)
    WorldTime instance = WorldTime(location: "Belin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime(); // 内部の時間を設定して取得する
    print(instance.time); // 取得した時間を console に表示
  }

  @override
  void initState() { // 初期化メソッド(最初に呼び出されるメソッド)
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen"),
    );
  }
}
