import 'package:flutter/material.dart';
import 'package:match_word/login/Home_Play.dart';
import 'package:match_word/single/Level.dart';
import 'package:match_word/multi/SelectPeople.dart';

class SingleOrMulti extends StatefulWidget {
  SingleOrMulti({Key? key}) : super(key: key);

  @override
  _SingleOrMulti createState() => _SingleOrMulti();
}

class _SingleOrMulti extends State<SingleOrMulti> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bgSetting.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Select Mode',
                      style: TextStyle(
                        fontSize: 64.0,
                        fontFamily: 'Palamecia',
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(0xFFF9F7C9),
                        shadows: [
                          Shadow(
                            blurRadius: 20,
                            color: Colors.black,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  RoundedButton(
                    'Single Player',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Level()),
                      );
                    },
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'PandaThin',
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                    borderColor: Color(0xFFF9F7C9),
                    borderWidth: 8.0,
                    buttonWidth: 270.0,
                    buttonHeight: 85.0,
                    backgroundColor: Color(0xFF7BD3EA),
                    pressedColor: Color(0xFF8ACDD7),
                  ),
                  SizedBox(height: 25),
                  RoundedButton(
                    'Multi player',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectPeople()),
                      );
                    },
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'PandaThin',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                    borderColor: Color(0xFFF9F7C9),
                    borderWidth: 8.0,
                    buttonWidth: 270.0,
                    buttonHeight: 85.0,
                    backgroundColor: Color(0xFF80BCBD),
                    pressedColor: Color(0xFF92C7CF),
                  ),
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
                      MaterialPageRoute(builder: (context) => PlayPage()),
                    );
                  },
                ),
              ],
            ),
          ],
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
  final Color backgroundColor;
  final Color pressedColor;

  RoundedButton(
      this.label,
      this.onPressed, {
        required this.textStyle,
        required this.buttonWidth,
        required this.buttonHeight,
        required this.borderColor,
        required this.borderWidth,
        this.backgroundColor = Colors.indigo,
        this.pressedColor = Colors.pink,
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
        primary: backgroundColor,
        onPrimary: pressedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return pressedColor;
          }
          return backgroundColor;
        }),
      ),
    );
  }
}