
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Card Widget"),
        ),
        body: ListView.builder(itemCount: 20,itemBuilder: (context, index) {
          return _cardItem();
        },)
    );
  }

  _cardItem() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.music_note, size: 30,),
            title: Text("Unknown Artist"),
            subtitle: Text("Prepared by unknown person"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text("Delete")),
              TextButton(onPressed: () {}, child: Text("Listen")),
            ],
          )
        ],
      ),
    );
  }

}
