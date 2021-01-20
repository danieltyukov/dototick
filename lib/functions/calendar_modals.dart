//identifying each event
class CalendarItem {
  static String table = 'events';

  int id;
  String name;
  String date;

  CalendarItem({this.id, this.date, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'date': date,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static CalendarItem fromMap(Map<String, dynamic> map) {
    return CalendarItem(
      id: map['id'],
      date: map['date'],
      name: map['name'],
    );
  }
}
