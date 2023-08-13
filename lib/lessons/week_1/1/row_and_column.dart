
import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  const RowAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row and Column"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.e,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,

            decoration: BoxDecoration(
                color: Colors.red
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,

            decoration: BoxDecoration(
                color: Colors.red
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,

            decoration: BoxDecoration(
                color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
