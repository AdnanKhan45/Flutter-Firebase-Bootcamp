
import 'package:flutter/material.dart';

class FlexibleAndExpanded extends StatelessWidget {
  const FlexibleAndExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible And Expanded"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),


              decoration: BoxDecoration(
                  color: Colors.red
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),


              decoration: BoxDecoration(
                  color: Colors.red
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                  color: Colors.red
              ),
            ),
          ),
        ],
      ),
    );
  }
}
