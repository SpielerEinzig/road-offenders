import 'dart:convert';

import 'package:http/http.dart' as http;

List<UserData> dataList = [];

class UserData {
  String id;
  int speed;
  String imageUrl;

  UserData({required this.id, required this.imageUrl, required this.speed});
}

getJsonObjects() async {
  http.Response response = await http
      .get(Uri.parse("http://road-traffic-offender.herokuapp.com/file/all"));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    for (var u in jsonData) {
      UserData userData =
          UserData(id: u["id"], imageUrl: u["image"], speed: u["speed"]);
      dataList.add(userData);
      print(u["image"]);
    }
  } else {
    print(response.statusCode);
  }

  return dataList;
}
