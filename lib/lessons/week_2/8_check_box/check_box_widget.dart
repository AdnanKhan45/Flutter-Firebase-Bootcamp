
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _selectedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox Flutter"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.red,
              value: _selectedBox,
              onChanged: (box) {
                setState(() {
                  _selectedBox = box!;
                });
              },
            ),
            title: Text("Terms and Conditions"),
          )
        ],
      ),
    );
  }
}
