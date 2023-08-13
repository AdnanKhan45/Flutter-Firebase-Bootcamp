
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: GestureDetector(onTap: () => Navigator.pop(context),child: Icon(Icons.ac_unit)),
        title: Text("Page 1"),
      ),
      body: Center(child: Text("Welcome to Page 1"),),
    );
  }
}
