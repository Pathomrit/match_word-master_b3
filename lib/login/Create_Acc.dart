import 'package:flutter/material.dart';
import 'package:match_word/login/Home_Play.dart';
class CreateAccPage extends StatefulWidget {
  CreateAccPage({Key? key}) : super(key: key);

  @override
  _CreateAccPageState createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpasslController = TextEditingController();
  final beigeColor = Color(0xFFe4d5b7);
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
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Icon(
                                Icons.person,
                                size: 200.0,
                                color: Colors.white,
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
                          fontFamily: 'FCIglooRounded[Non-commercial]',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: ' ACCOUNT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _nicknameController,
                            decoration: InputDecoration(
                              hintText: 'Your nickname',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _emailController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Your name',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Your password',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 350.0,
                          child: TextField(
                            controller: _confirmpasslController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm password',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade400,
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo.shade800,
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35.0),
                        RoundedButton(
                          icon: Icon(Icons.arrow_forward, size: 34.0, color: Colors.white),
                          onPressed: () {
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
                          buttonColor: Colors.amber,
                          borderColor: Colors.amber,
                          borderWidth: 3.0,
                          buttonSize: 50.0,
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
  final Widget icon;
  final Function onPressed;
  final TextStyle textStyle;
  final double buttonSize;
  final Color borderColor;
  final double borderWidth;
  final Color buttonColor;

  RoundedButton({
    required this.icon,
    required this.onPressed,
    required this.textStyle,
    required this.buttonSize,
    required this.borderColor,
    required this.borderWidth,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        child: Center(
          child: icon,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: CircleBorder(),
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}

