
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with TickerProviderStateMixin {

  late TabController _controller;

  // This method is called only once when the Stateful Widget
  // widget is inserted in widget tree.
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  // To avoid memory leaks, and clean everything up if
  // widget is destroyed and is no more in the widget tree.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBars"),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(text: "Cloud", icon: Icon(Icons.cloud),),
            Tab(text: "Terrain", icon: Icon(Icons.terrain),),
            Tab(text: "Wave", icon: Icon(Icons.waving_hand),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: Text("Hey! This is Tab 1", style: TextStyle(fontSize: 20),),),
          Center(child: Text("Hey! This is Tab 2", style: TextStyle(fontSize: 20),),),
          Center(child: Text("Hey! This is Tab 3", style: TextStyle(fontSize: 20),),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _controller.animateTo(2);
        },
      ),
    );
  }
}
