
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/auth_success_page.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/sign_in_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  bool _isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset("assets/flutter.png")),

                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Flutter",
                          style: TextStyle(fontSize: 55, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: "Username", border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Form must not be empty";
                        } else if (value.length < 5) {
                          return "Must be at least 5 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,

                      decoration: InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Form must not be empty";
                        } else if (!value.contains("@")) {
                          return "Email is not correctly formatted";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,

                      decoration: InputDecoration(
                          hintText: "Password", border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Form must not be empty";
                        } else if (value.length < 6) {
                          return "Must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Ctrl + Alt + Shift + L (Format Code)
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Align(alignment: Alignment.center,child: _isSigningUp == true ? CircularProgressIndicator(color: Colors.white,) : Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have and account?", style: TextStyle(fontSize: 15),),
                  SizedBox(width: 5,),
                  GestureDetector(onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
                  },child: Text("Sign In", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signUp() async {
    if(_formKey.currentState!.validate()) {
      setState(() => _isSigningUp = true);
      final auth = FirebaseAuth.instance;

      try {
        await auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
          setState(() => _isSigningUp = false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthSuccessPage()));

        });
      } on FirebaseAuthException catch (e) {
        setState(() => _isSigningUp = false);
        if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: "The account already exists for that email.");
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(msg: "The email address is not valid.");
        } else if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password is not strong enough.');
        } else {
          Fluttertoast.showToast(msg: "Error: ${e.message}");
        }
      }

    } else {
      return null;
    }
  }
}




