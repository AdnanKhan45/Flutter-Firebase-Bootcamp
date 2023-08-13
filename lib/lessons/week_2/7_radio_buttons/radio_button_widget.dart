
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _selectedBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button Flutter"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Radio(
                value: 0, groupValue: _selectedBox, onChanged: (box) {
              setState(() {
                _selectedBox = box!;
              });
            }),
            title: Text("Flutter App Development"),
          ),
          ListTile(
            leading: Radio(
                value: 1, groupValue: _selectedBox, onChanged: (box) {
              setState(() {
                _selectedBox = box!;
              });
            }),
            title: Text("Android App Development"),
          ),
          ListTile(
            leading: Radio(
                value: 2, groupValue: _selectedBox, onChanged: (box) {
              setState(() {
                _selectedBox = box!;
              });
            }),
            title: Text("iOS App Development"),
          )
        ],
      ),
    );
  }
}
