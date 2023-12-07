import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:managment/Screens/beforelogin.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class MySplashScreen extends StatefulWidget {
 @override
 _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
 @override
 void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => beforelogin()));
    });
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( // Mengganti kontainer dengan expanded
              flex: 2, // Mengubah ukuran width container
              child: Image.asset("images/splashscreentop1.png"),
            ),
            Expanded(
              flex: 5, // Mengubah ukuran height container
              child: Image.asset("images/zuhrifinances.png"),  
            ),
            Expanded(
              flex: 3, // Mengubah ukuran height container
              child: Image.asset("images/zuhricorp.png"),  
            ),
            Expanded(
              flex: 2, // Mengubah ukuran width container
              child: Image.asset("images/splashscreenbot1.png"),  
            ),
          ],
        ),
      ),
    );
 }
}