
import 'package:flutter/material.dart';

class FlutterListView extends StatelessWidget {
  const FlutterListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Checkout the ListView examples below
    return Column(
      children: [
        // Example#1
        // inside ListView()
        // ListTile(
        //   leading: Container(
        //     width: 50,
        //     height: 50,
        //     decoration: BoxDecoration(
        //         color: Colors.grey,
        //         shape: BoxShape.circle
        //     ),
        //   ),
        //   title: Text("Username"),
        //   subtitle: Text("Some description"),
        //   trailing: Icon(Icons.delete),
        // )

        // Example#2
        // To build the items specified/infinite
        // number of times
        // ListView.builder()
        // ListView.builder(itemBuilder: (context, index) {
        //   return ListTile(
        //           leading: Container(
        //             width: 50,
        //             height: 50,
        //             decoration: BoxDecoration(
        //                 color: Colors.grey,
        //                 shape: BoxShape.circle
        //             ),
        //           ),
        //           title: Text("Username"),
        //           subtitle: Text("Some description"),
        //           trailing: Icon(Icons.delete),
        //         )
        // })

        // Example#3
        // The only addition is of separatorBuilder()
        // to build the separator widget between
        // each widget returned by itemBuilder().
        //ListView.separated()
        // ListView.separated(
        //   itemCount: 20,
        //     separatorBuilder: (context, separator) {
        //       return Container(width: double.infinity, height: 10, color: Colors.blueAccent,);
        //     },
        //     itemBuilder: (context, index) {
        //   return ListTile(
        //           leading: Container(
        //             width: 50,
        //             height: 50,
        //             decoration: BoxDecoration(
        //                 color: Colors.grey,
        //                 shape: BoxShape.circle
        //             ),
        //           ),
        //           title: Text("Username"),
        //           subtitle: Text("Some description"),
        //           trailing: Icon(Icons.delete),
        //         )
        // }
        // )


        // Example#4
        // We can either have the SLiverChildListDelegate
        // for same functionality as ListView() and
        // SliverChildBuilderDelegate for ListView.builder()
        // constructor functionality.
        ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: Text("Username"),
              subtitle: Text("Some description"),
              trailing: Icon(Icons.delete),
            );
          },
              childCount: 20),
        )
      ],
    );
  }
}
