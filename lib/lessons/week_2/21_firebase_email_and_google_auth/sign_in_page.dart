import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/auth_success_page.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
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
                          style: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
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
                        if (value!.isEmpty) {
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
                      onTap: _signIn,
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                            alignment: Alignment.center,
                            child: _isSigningIn == true
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: _signInWithGoogle,
                      icon: Icon(FontAwesomeIcons.google),
                      label: Text("Sign In with Google"),
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
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSigningIn = true);
      final auth = FirebaseAuth.instance;

      try {
        await auth
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          setState(() => _isSigningIn = false);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AuthSuccessPage()));
        });
      } on FirebaseAuthException catch (e) {
        setState(() => _isSigningIn = false);
        if (e.code == "user-not-found") {
          Fluttertoast.showToast(msg: "User Not Found");
        } else if (e.code == "wrong-password") {
          Fluttertoast.showToast(msg: "Invalid Email or Password");
        } else {
          Fluttertoast.showToast(msg: "Error ${e.message}");
        }
      }
    } else {
      return null;
    }
  }

  Future<void> _signInWithGoogle() async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken
        );

        await _auth.signInWithCredential(credential);
      }

    } catch (e) {
      Fluttertoast.showToast(msg: "Error $e");
    }

  }
}
