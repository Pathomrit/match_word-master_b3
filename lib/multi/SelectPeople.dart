import 'package:flutter/material.dart';
import 'package:match_word/login/Single_Multi.dart';
import 'package:match_word/multi/twopeople/Two.dart';
import 'package:match_word/multi/threepeople/Three.dart';
import 'package:match_word/multi/fourpeople/Four.dart';
import 'package:match_word/setting/DataMultiPlayer.dart';

class SelectPeople extends StatefulWidget {
  SelectPeople({Key? key}) : super(key: key);

  @override
  _SelectPeople createState() => _SelectPeople();
}

class _SelectPeople extends State<SelectPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgMulti.png',
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
                    'Select People',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      fontFamily: 'DANKI',
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
                  'Two People',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Two()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'PandaThin',
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
                  'Three People',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Three()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'PandaThin',
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
                  'Four People',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Four()),
                    );
                  },
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'PandaThin',
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
                    builder: (context) => MultiPlayerSetting(),
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
