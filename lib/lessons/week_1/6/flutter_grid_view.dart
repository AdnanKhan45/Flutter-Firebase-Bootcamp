import 'package:flutter/material.dart';

class FlutterGridView extends StatelessWidget {
  const FlutterGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Checkout the GridView examples below
    return Column(
      children: [
        // Example#1
        // GridView(
        //   padding: EdgeInsets.all(10),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Colors.lightGreen
        //       ),
        //     ),
        //   ],
        // ),

        // Example#2
        // Expanded(
        //   child: GridView.builder(itemCount: 10,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10), itemBuilder: (context, index) {
        //     return Container(
        //               width: 100,
        //               height: 100,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.lightGreen
        //               ),
        //             );
        //   }),
        // )

        // Example#3
        // GridView.custom(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10), childrenDelegate: SliverChildListDelegate([
        //               width: 100,
        //               height: 100,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.lightGreen
        //               ),
        //             );
        // ]))

        // Example#4
        //GridView.count(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, children: [],),
        // Expanded(
        //   child: GridView.extent(
        //     maxCrossAxisExtent: 100,
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //     children: [
        //       Container(
        //         width: 100,
        //         height: 100,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.lightGreen),
        //       ),
        //     ],
        //   ),
        // )

        // Example#5
        // GridView.extent(
        //   maxCrossAxisExtent: 60,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   padding: EdgeInsets.all(10),
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Colors.lightGreen
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
