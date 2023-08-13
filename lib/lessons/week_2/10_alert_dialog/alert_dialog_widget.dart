

import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog Flutter"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.grey,
                title: Text("Alert!"),
                content: Text("Something went wrong!"),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Cancel")),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Okay")),
                ],
              );
            });
          },
          child: Text("Click Me"),
        ),
      ),
    );
  }
}
