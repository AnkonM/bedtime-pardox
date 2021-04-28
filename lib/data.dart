import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Paradox {
  String title;
  String text;

  Paradox(this.title, this.text);
}

List<Paradox> paradoxList = [];

loadJson() async {
  String data = await rootBundle.loadString('assets/database.json');
  Map<String, dynamic> jsonResult = json.decode(data);
  // print(jsonResult);
  jsonResult.forEach((k, v) {
    // print("Key : $k, Value : $v");
    paradoxList.add(Paradox(k, v));
  });
}
