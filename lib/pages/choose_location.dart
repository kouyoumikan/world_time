import 'package:flutter/material.dart';
import 'package:jp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async { // データの更新時間を取得する非同期メソッド
    WorldTime instance = locations[index]; // WorldTime Listの場所を保存するインスタンス
    await instance.getTime(); // インスタンスの取得時間

    // navigate to home screen(選択したWorldTimeのデータに更新し、ホーム画面へ移動する)
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
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
      body: ListView.builder( // WorldTimeのListの中身を取得
          itemCount: locations.length, // アイテムの数
          itemBuilder: (context, index) { // アイテムの場所を取得
            return Padding( // リストタイル型のボックスの周りの間隔を開ける
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile( // リストタイル型のボックスを設置
                  onTap: () { // リストタイル型を押下時のイベント
                    updateTime(index); // WorldTime Listの場所を呼び出す
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar( // 丸いアバターを作成し、写真を配置
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
