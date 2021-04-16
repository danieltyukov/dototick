import 'dart:convert';

class Weektasks {
  int id;
  int day;
  String name;

  Weektasks({this.id, this.day, this.name});

  factory Weektasks.fromMap(Map<String, dynamic> json) => new Weektasks(
        id: json["id"],
        day: json["day"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "day": day,
        "name": name,
      };
}

Weektasks weektasksFromJson(String str) {
  final jsonData = json.decode(str);
  return Weektasks.fromMap(jsonData);
}

String weektasksToJson(Weektasks data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
