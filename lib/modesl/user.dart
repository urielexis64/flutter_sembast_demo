import 'package:faker/faker.dart';

class User {
  final String id;
  final String name, email;
  final int age;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.age});

  static User fake() {
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    final String name = faker.person.name();
    final String email = faker.internet.email();
    final int age = RandomGenerator().integer(100, min: 18);
    return new User(id: id, name: name, email: email, age: age);
  }

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age']);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
  }
}
