class Task {
  int? id;
  String? name;
  int? age;
  String? position;
  String? place;
  String? address;

  Task({
    this.id,
    this.name,
    this.age,
    this.position,
    this.place,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'position': position,
      'place': place,
      'address': address,
    };
  }

  Task.fromMap(Map<String, dynamic> task) {
    id = task['id'];
    name = task['name'];
    age = task['age'];
    position = task['position'];
    place = task['place'];
    address = task['address'];
  }
}
