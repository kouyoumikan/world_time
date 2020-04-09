import 'package:flutter/material.dart';
import 'package:jp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";

  // WorldTimeクラスの新しいインスタンスを作成
  void setupWorldTime() async {  // データを取得する同期メソッド
    // WorldTimeインスタンス(場所フラグとURL)
    WorldTime instance = WorldTime(location: "Belin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime(); // 内部の時間を設定して取得する
    print(instance.time); // 取得した時間を console に表示

    setState(() { // 設定状態を使用して、timeプロパティを更新する
      time = instance.time; // timeプロパティとインスタンス時間を等しく設定
    });
  }

  @override
  void initState() { // 初期化メソッド(最初に呼び出されるメソッド)
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time), // app画面に取得した日付/時刻を表示
      ),
    );
  }
}
