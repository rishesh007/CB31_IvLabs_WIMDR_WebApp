import 'package:flutter/material.dart';

class User {
  String name;
  String id;
  Image image;
  String email;
  String password;

  User({this.name, this.id, this.image, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'password' : password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return User(
      email: map['email'],
      id: map['id'],
      name: map['name'],
      password: map['password'],
    );
  }
}

List<User> userList = [
  User(
    name: 'Rohit Lal',
    email: 'take2rohit@gmail.com',
    id: '321',
    password: '123',
    image: Image.asset(
      'images/rohit.jpeg',
      width: 50,
      height: 50,
    ),
  ),
];

num currentUser = 0;

void changeUser(num val) {
  currentUser = val;
}
