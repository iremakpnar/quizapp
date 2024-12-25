import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Hizalamayı sola yapıyoruz
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('icons/user.png', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Nilay",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 20), // Vertical space between items
            Row(
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20), // Vertical space between Settings and next items
            Row(
              children: <Widget>[
                Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "Help",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20), // Vertical space between Help and next items
            Row(
              children: <Widget>[
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20), // Vertical space between About and next items
            Row(
              children: <Widget>[
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
