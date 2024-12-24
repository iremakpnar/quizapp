import 'package:flutter/material.dart';
import 'package:ygkdemo/Pages/drawer_screen.dart';
import 'package:ygkdemo/Pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Drawer ekranı
          DrawerScreen(),
          // Ana ekran (HomePage)
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.85 : 1.0),
            child: GestureDetector(
              onTap: () {
                if (isDrawerOpen) {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    isDrawerOpen = false;
                  });
                }
              },
              child: HomePage(
                onMenuTap: () {
                  setState(() {
                    xOffset = 250;
                    yOffset = 80;
                    isDrawerOpen = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
