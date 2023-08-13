
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {

  bool _selectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switches Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Light", style: TextStyle(fontSize: 18),),
            Switch(
              activeColor: Colors.green,
              activeTrackColor: Colors.red,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.yellow,
              value: _selectedSwitch,
              onChanged: (s) {
                setState(() {
                  _selectedSwitch = s;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
