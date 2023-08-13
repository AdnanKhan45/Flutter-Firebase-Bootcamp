
import 'package:flutter/material.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Bottom Sheet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showBottomSheet,
          child: Text("Modal Bottom Sheet"),
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      //backgroundColor: change bg,

      // on drag close sheet OFF
      //enableDrag: false,

      // onClick on other part of the screen
      // dismissible OFF
      //isDismissible: false,

      // for Customizable height
        isScrollControlled: true,

        // Rounded Corners
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            // height: 300 --> you can set manual height
            // default height is 60% of the screen.
            margin: EdgeInsets.all(10),
            // Because of more content to get
            // scrollable view - use ListView()
            // but this will give you scrollable
            // view at the fix size.
            child: Column(
              // To ignore the height constraints
              // upcoming from parent of the
              // Column we set it to min.
              // so that will get only the space
              // that is required by Column's
              // children
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.navigation_outlined),
                  title: Text("Page1"),
                  subtitle: Text("description"),
                ),
                ListTile(
                  leading: Icon(Icons.navigation_outlined),
                  title: Text("Page2"),
                  subtitle: Text("description"),
                ),
                Text(
                  "nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.im id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          );
        });
  }
}


