import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI(UIの場所名)
  String time;     // the time in that location(上記の時間)
  String flag;     // url to an asset flag icon(フラグアイコンへのURL)
  String url;      // location url for api endpoint(APIエンドポイントのURL)

  // WorldTimeの新しいインスタンスを作成
  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async { // データを取得する非同期メソッド

    try { // データ取得
      // make the response
      http.Response response = await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print((data));

      // get properties from data
      String datetime = data["datetime"]; // 日付・時刻
      String offset = data["utc_offset"].substring(1,3); // 部分文字列の作成
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime); // 文字列を日付/時刻オブジェクトに変換
      now = now.add(Duration(hours: int.parse(offset))); // 文字列を整数に変換

      // set the time property(時間を設定する)
      time = now.toString();
    }
    catch (e) { // データ取得の際、エラーが発生時のイベント
      print("caught error: $e");
      time = "could not get time data"; // app画面にエラーメッセージを表示
    }
  }

}

