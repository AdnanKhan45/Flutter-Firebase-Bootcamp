
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_1/8/on_boarding.dart';
import 'package:flutter_basics/lessons/week_1/8/on_boarding_item.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  List<OnBoardingEntity> _onBoardingData = OnBoardingEntity.onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(itemCount: _onBoardingData.length,itemBuilder: (context, index) {
          return OnBoardingItem(title: _onBoardingData[index].title, description: _onBoardingData[index].description, image: _onBoardingData[index].image, index: index);
        })
    );
  }
}
