import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  late String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);

      String place = data["timezone"];
      int index = place.indexOf('/');
      place = place.substring(index+1);
      location = place;

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      /*Set time property*/
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "There is an error in the database";
    }
  }

  Future<void> getIpData() async {
    try {
      var uri = Uri.parse('http://worldtimeapi.org/api/ip');
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      String place = data["timezone"];
      int index = place.indexOf('/');
      place = place.substring(index+1);

      location = place;
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      /*Set time property*/
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "There is an error in the database";
    }
  }
}
