
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Container(
        color:Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/image.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "Lisa Parker",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
            Divider(color: Colors.white,),
            _listItem(icon: Icons.security_rounded, title: "Privacy Policy", onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PrivacyPolicyPage()));
            }),
            _listItem(icon: Icons.favorite_outline, title: "Favorites", onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FavoritesPage()));
            }),
            _listItem(icon: Icons.notifications_none, title: "Notifications", onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NotificationsPage()));
            }),
            Divider(color: Colors.white,),
            _listItem(icon: Icons.help, title: "Help", onTap: () {}),
            _listItem(icon: Icons.report, title: "Report",onTap: () {}),
          ],
        ),
      ),
    );
  }

  _listItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      iconColor: Colors.white,
      textColor: Colors.white,
      leading: Icon(icon, size: 30,),
      title: Text(title, style: TextStyle(fontSize: 16),),
    );
  }

}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Center(
        child: Text(
          "App's Privacy Policy",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites Page"),
      ),
      body: Center(
        child: Text(
          "Here's Your Favorites",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications Page"),
      ),
      body: Center(
        child: Text(
          "No Notifications Yet",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
