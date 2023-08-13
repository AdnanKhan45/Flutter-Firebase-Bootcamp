
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreCrudBasicsWidget extends StatefulWidget {
  const CloudFirestoreCrudBasicsWidget({Key? key}) : super(key: key);

  @override
  State<CloudFirestoreCrudBasicsWidget> createState() => _CloudFirestoreCrudBasicsWidgetState();
}

class _CloudFirestoreCrudBasicsWidgetState extends State<CloudFirestoreCrudBasicsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Firestore CRUD"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _createData(User(
                  username: "steve jobs",
                  email: "jobs@gmail.com",
                ));
              },
              child: Text("Create Data"),
            ),
          ),
          StreamBuilder<List<User>>(
            stream: _readData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text("No Data"),
                );
              }
              final users = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: users!.map((user) {
                    return ListTile(
                      leading: GestureDetector(
                          onTap: () {
                            _deleteData(user.id!);
                          }
                          ,child: Icon(Icons.delete)),
                      trailing: GestureDetector(
                          onTap: () {
                            _updateData(User(
                                id: user.id,
                                email: "aaa@gmail.com",
                                username: "aaaa"
                            ));
                          },
                          child: Icon(Icons.update)),
                      title: Text(user.username!),
                      subtitle: Text(user.email!),
                    );
                  }).toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Stream<List<User>> _readData() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => User.fromSnapshot(e)).toList());
  }

  _updateData(User user) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final newData = User(
        username: user.username,
        id: user.id,
        email: user.email
    ).toJson();

    userCollection.doc(user.id).update(newData);
  }

  _deleteData(String id) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    userCollection.doc(id).delete();
  }

  _createData(User user) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    String id = userCollection.doc().id;
    final newUser =
    User(username: user.username, id: id, email: user.email).toJson();

    userCollection.doc(id).set(newUser);
  }
}

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