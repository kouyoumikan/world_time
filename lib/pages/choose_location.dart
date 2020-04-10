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
            return Card(
              child: ListTile( // リストタイル型のボックスを設置
                onTap: () {},
                title: Text(locations[index].location),
                leading: CircleAvatar( // 丸いアバターを作成し、写真を配置
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            );
          }
      ),
    );
  }
}
