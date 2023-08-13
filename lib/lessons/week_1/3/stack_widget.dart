
import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned Child Widget of stack
        Positioned(
          bottom: 10,
          left: 100,
          right: 5,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.red
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 100,
          right: 5,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.green
            ),
          ),
        ),
        // Non-Positioned Child Widget of Stack
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.blueAccent
          ),
        ),
      ],
    );
  }
}
