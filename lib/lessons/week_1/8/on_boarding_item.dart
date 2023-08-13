
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int index;

  const OnBoardingItem(
      {Key? key,
        required this.title,
        required this.description,
        required this.image,
        required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/$image")),
        SizedBox(height: 20),
        Text(
          "$title",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          "$description",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.black : Colors.grey),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 1 ? Colors.black : Colors.grey),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 2 ? Colors.black : Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}