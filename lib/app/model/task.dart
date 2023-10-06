class Task {
  int? id;
  String? title;
  String? note;
  String? date;
  String? place;
  String? address;

  Task({
    this.id,
    this.title,
    this.note,
    this.date,
    this.place,
    this.address,
  });

  // Task.fromMap(Map<String, dynamic> task) {
  //   id = task['id'];
  //   title = task['title'];
  //   note = task['note'];
  //   date = task['date'];
  //   place = task['place'];
  //   address = task['address'];
  // }

  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['note'] = this.note;
  //   data['date'] = this.date;
  //   data['place'] = this.place;
  //   data['address'] = this.address;
  //   return data;
  // }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "note": note,
      "date": date,
      "place": place,
      "address": address,
    };
  }

  Task.fromMap(Map<String, dynamic> task) {
    id = task['id'];
    title = task['title'];
    note = task['note'];
    date = task['date'];
    place = task['place'];
    address = task['address'];
  }
}
