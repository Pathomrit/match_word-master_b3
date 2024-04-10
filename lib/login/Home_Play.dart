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
              'assets/images/bluegradient.jpg',
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
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/Logo_MatchCard.png',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.0),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontFamily: 'TonphaiThin',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: ' Matching Card',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '--------------------🎮------------------',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontFamily: 'TonphaiThin',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 80.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton('START', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingleOrMulti()),
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

                        SizedBox(height: 15.0),
                        RoundedButton('⚙️ Setting', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Request()),
                          );
                        },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 3.5,
                          buttonWidth: 250.0,
                          buttonHeight: 50.0,
                        ),
                        SizedBox(height: 15.0),
                        RoundedButton('Exit', () {
                          SystemNavigator.pop();
                        },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 27.0,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 3.0,
                          buttonWidth: 250.0,
                          buttonHeight: 50.0,
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

  RoundedButton(
      this.label, this.onPressed, {
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