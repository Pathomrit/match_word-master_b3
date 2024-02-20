import 'dart:async';
import 'package:flutter/material.dart';
import 'package:match_word/login/Home_Login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final creamColor = Color(0xFFCEC4B3);
  final beigeColor = Color(0xFFe4d5b7);

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;
            const delay = 0.6;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
                  .animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(delay, 1, curve: curve),
                ),
              ),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/homePic2_v4_newLogo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
