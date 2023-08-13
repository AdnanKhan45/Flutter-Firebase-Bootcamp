import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/1_Routes/page_1.dart';
import 'package:flutter_basics/lessons/week_2/1_Routes/page_2.dart';
import 'package:flutter_basics/lessons/week_2/1_Routes/page_3.dart';

class OnGenerateRoutes {

  static Route<dynamic>? route(RouteSettings settings) {

    switch(settings.name) {
      case "page1": {
        return MaterialPageRoute(builder: (context) => Page1());
      }
      case "page2": {
        return MaterialPageRoute(builder: (context) => Page2());
      }
      case "page3": {
        return MaterialPageRoute(builder: (context) => Page3());
      }
      default: {
        Scaffold();
      }
    }
  }
}