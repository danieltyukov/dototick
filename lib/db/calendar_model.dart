import 'dart:convert';

import 'package:dototick/screens/calendar.dart';

Calendar calendarFromJson(String str) {
  final jsonData = json.decode(str);
  return Calendar.fromMap(jsonData);
}

String calendarToJson(Calendar data) {
  final dyn = data.toMap();

  return json.encode(dyn);
}

class Calendar {
  int id;
  String name;
  String date;

  Calendar({this.id, this.name, this.date});

  factory Calendar.fromMap(Map<String, dynamic> json) => new Calendar(
        id: json["id"],
        name: json["name"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "date": date,
      };
}
