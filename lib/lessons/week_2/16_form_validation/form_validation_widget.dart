
import 'package:flutter/material.dart';

class FormValidationWidget extends StatefulWidget {
  const FormValidationWidget({Key? key}) : super(key: key);

  @override
  State<FormValidationWidget> createState() => _FormValidationWidgetState();
}

class _FormValidationWidgetState extends State<FormValidationWidget> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
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
                      onTap: _login,
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Align(alignment: Alignment.center,child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Don't have an account? Create Account", style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }

  _login() {
    if(_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
    } else {
      return null;
    }
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Success"),
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
