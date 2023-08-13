
import 'package:flutter/material.dart';

class PopUpMenuWidget extends StatefulWidget {
  const PopUpMenuWidget({Key? key}) : super(key: key);

  @override
  State<PopUpMenuWidget> createState() => _PopUpMenuWidgetState();
}

class _PopUpMenuWidgetState extends State<PopUpMenuWidget> {
  int _selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopUpMenu"),
        actions: [
          PopupMenuButton(
            onSelected: (menu) {
              setState(() {
                _selectedMenu = menu;
              });
            },
            initialValue: _selectedMenu,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text('Item 1'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('Item 2'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Item 3'),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
