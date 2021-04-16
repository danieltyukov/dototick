import 'dart:convert';

class Dailytask {
  int id;
  String name;

  Dailytask({this.id, this.name});

  factory Dailytask.fromMap(Map<String, dynamic> json) => new Dailytask(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

Dailytask dailytaskFromJson(String str) {
  final jsonData = json.decode(str);
  return Dailytask.fromMap(jsonData);
}

String dailytaskToJson(Dailytask data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
