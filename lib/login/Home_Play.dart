import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match_word/login/Single_Multi.dart';
import 'package:match_word/setting/SettingRequest.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key? key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/flower_purple.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/Logo_MatchCard.png',
                                width: 330.0,
                                height: 330.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 56.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                          'START',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleOrMulti()),
                            );
                          },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontFamily: 'Palamecia',
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],

                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 8.0,
                          buttonWidth: 260.0,
                          buttonHeight: 80.0,
                          backgroundColor: Color(0xFFFFC0CB),
                          pressedColor: Color(0xFFE393B8),
                        ),
                        SizedBox(height: 22.0),
                        RoundedButton(
                          'Options',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Request()),
                            );
                          },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontFamily: 'Palamecia',
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],

                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 8.0,
                          buttonWidth: 260.0,
                          buttonHeight: 80.0,
                          backgroundColor: Color(0xFFFFD5C0),
                          pressedColor: Color(0xFFE393B8),
                        ),
                        SizedBox(height: 22.0),
                        RoundedButton(
                          'Quit',
                              () {
                            SystemNavigator.pop();
                          },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontFamily: 'Palamecia',
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],

                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 8.0,
                          buttonWidth: 260.0,
                          buttonHeight: 80.0,
                          backgroundColor: Color(0xFFb1dd9e),
                          pressedColor: Color(0xFF97cf8a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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