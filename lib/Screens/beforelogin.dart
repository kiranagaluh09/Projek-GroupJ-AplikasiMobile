import 'package:flutter/material.dart';
import 'package:managment/Screens/Login.dart';
import 'package:managment/Screens/loginandregis.dart';
import 'package:managment/Screens/register.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class beforelogin extends StatefulWidget {
 @override
 _beforelogin createState() => _beforelogin();
}

class _beforelogin extends State<beforelogin> {
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
            Expanded(
              flex: 2,
              child: Image.asset("images/beforelogin.png"),
            ),
            Expanded(
              flex: 5,
              child: Image.asset("images/logozuhri.png"),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Welcome to Zuhri Finances Manage Your FInances More Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                 color: Colors.black,
                 fontSize: 20,
                 fontStyle: FontStyle.italic,
                 fontFamily: 'Urbanist',
                 fontWeight: FontWeight.w700,
                 height: 0,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 AnimatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    color: Color(0xFF1E232C),
                    child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 20),),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }
}

class AnimatedButton extends StatefulWidget {
 final VoidCallback onPressed;
 final Color color;
 final Widget child;

 AnimatedButton({required this.onPressed, required this.color, required this.child});

 @override
 _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
 double scale = 1.0;

 @override
 Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          scale = 0.95;
        });
      },
      onTapUp: (details) {
        setState(() {
          scale = 1.0;
        });
      },
      child: Transform.scale(
        scale: scale,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            primary: widget.color,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            minimumSize: Size(MediaQuery.of(context).size.width * 0.60, 50),
          ),
          child: widget.child,
        ),
      ),
    );
 }
}