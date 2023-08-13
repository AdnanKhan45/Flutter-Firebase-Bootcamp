
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarAndToastWidget extends StatelessWidget {
  const SnackBarAndToastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {

            // Show Toast Message (You can also modify) by changing the properties.
            Fluttertoast.showToast(msg: "Hello Im Toast Message",
                gravity: ToastGravity.BOTTOM,
                fontSize: 16,
                backgroundColor: Colors.green,
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white);


            // Show SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Hello Im Snack Bar"),
              ),
            );

            // Delay for few seconds
            await Future.delayed(Duration(seconds: 1));

            // Hide/Remove the SnackBar if we want.
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Text("Click Me"),
        ),
      ),
    );
  }
}
