import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? username;
  final String? email;
  final String? id;

  User({this.username, this.email, this.id});

  static User fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return User(
        username: snapshot['username'],
        email: snapshot['email'],
        id: snapshot['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "id": id,
    };
  }
}