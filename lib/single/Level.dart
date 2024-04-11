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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SingleOrMulti()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bluegradient.jpg',
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
                    'Level',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontFamily: 'TonphaiThin',
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
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.settings_applications_outlined),
              iconSize: 70,
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SingleOrMulti()),
            );
          },
        ),
      ),
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
