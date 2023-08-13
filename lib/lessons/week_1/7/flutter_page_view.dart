
import 'package:flutter/material.dart';

class FlutterPageView extends StatefulWidget {
  const FlutterPageView({Key? key}) : super(key: key);

  @override
  State<FlutterPageView> createState() => _FlutterPageViewState();
}

class _FlutterPageViewState extends State<FlutterPageView> {

  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(onPressed: () {
            _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          }, icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: () {
            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          }, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          print(value);
        },
        children: [
          Container(
            color: Colors.red,
            child: Center(child:Text("Page 1")),
          ),
          Container(
            color: Colors.green,
            child: Center(child:Text("Page 2")),
          ),
          Container(
            color: Colors.blueAccent,
            child: Center(child:Text("Page 3")),
          )

        ],
      ),
    );
  }
}
