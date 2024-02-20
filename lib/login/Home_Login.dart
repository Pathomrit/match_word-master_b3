import 'package:flutter/material.dart';
import 'package:match_word/login/Home_Play.dart';
import 'package:match_word/login/Create_Acc.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                                'assets/images/Logo_MatchCard_V2.jpg',
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
                          fontSize: 40.0,
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
                    SizedBox(height: 50.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: '👤 Username',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '🔓 Password',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),


                        SizedBox(height: 20.0),
                        RoundedButton('SIGN IN', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PlayPage()),
                          );
                        },
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'FCIglooRounded[Non-commercial]',
                            fontWeight: FontWeight.bold,
                          ),
                          borderColor: Colors.indigo.shade200,
                          borderWidth: 3.0,
                          buttonWidth: 100.0,
                          buttonHeight: 50.0,
                        ),
                        SizedBox(height: 30.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateAccPage()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontFamily: 'FCIglooRounded[Non-commercial]',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Create ',
                                ),
                                TextSpan(
                                  text: 'ACCOUNT',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
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