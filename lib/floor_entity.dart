// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int age;
  final String country;
  final String? email;
  User({
    this.id,
    required this.name,
    required this.age,
    required this.country,
    required this.email,
  });

  User copyWith({
    int? id,
    String? name,
    int? age,
    String? country,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      country: country ?? this.country,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'country': country,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      age: map['age'] as int,
      country: map['country'] as String,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, age: $age, country: $country, email: $email)';
  }

  
}
