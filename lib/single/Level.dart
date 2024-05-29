import 'package:flutter/material.dart';
import 'package:match_word/login/Single_Multi.dart';
import 'package:match_word/single/Easy.dart';
import 'package:match_word/single/Hard.dart';
import 'package:match_word/single/Medium.dart';
import 'package:match_word/setting/DataSinglePlayer.dart';
import 'package:match_word/single/ex.dart';

class Level extends StatefulWidget {
  Level({Key? key}) : super(key: key);

  @override
  _Level createState() => _Level();
}

class _Level extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgLevel.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Game Mode',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.0,
                      fontFamily: 'TonphaiThin',
                      shadows: [
                        Shadow(
                          blurRadius: 60,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                RoundedButton(
                  'Easy',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Easy()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'TonphaiThin',
                    fontWeight: FontWeight.bold,
                  ),
                  borderColor: Colors.indigo.shade200,
                  borderWidth: 3.0,
                  buttonWidth: 250.0,
                  buttonHeight: 50.0,
                ),
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                  'Medium',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Medium()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'TonphaiThin',
                    fontWeight: FontWeight.bold,
                  ),
                  borderColor: Colors.indigo.shade200,
                  borderWidth: 3.0,
                  buttonWidth: 250.0,
                  buttonHeight: 50.0,
                ),
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                  'Hard',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hard()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'TonphaiThin',
                    fontWeight: FontWeight.bold,
                  ),
                  borderColor: Colors.indigo.shade200,
                  borderWidth: 3.0,
                  buttonWidth: 250.0,
                  buttonHeight: 50.0,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              IconButton(
                padding: EdgeInsets.only(top: 30),
                icon: Image.asset(
                  'assets/images/arrowBack.png',
                  width: 50,
                  height: 50,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SingleOrMulti()),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              icon: Image.asset(
                'assets/images/settings.png',
                width: 50,
                height: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SinglePlayerSetting(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  final String level;

  GamePage({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the $level level game.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final TextStyle textStyle;
  final double buttonWidth;
  final double buttonHeight;
  final Color borderColor;
  final double borderWidth;

  RoundedButton(
    this.label,
    this.onPressed, {
    required this.textStyle,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}
