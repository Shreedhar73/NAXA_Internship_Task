import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RemoteServices {
  Box box;

  Future openBox() async {
    var dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  Future<Map<String, dynamic>> getAllData() async {
    await openBox();
    String url = "https://reqres.in/api/users?page=1";

    try {
      var response = await http.get(Uri.parse(url));

      var _jsonDecode = jsonDecode(response.body);

      await putData(response.body);
      return _jsonDecode;
    } catch (SocketException) {
      var data = box.get("users");
      return jsonDecode(data);
    }
  }

  Future putData(String data) async {
    await box.clear();
    await box.put("users", data);
  }
}
