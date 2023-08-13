
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/sign_in_page.dart';

class AuthSuccessPage extends StatelessWidget {
  const AuthSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Success"),
        actions: [
          IconButton(onPressed:  () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
            });
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.done, color: Colors.white, size: 50,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}