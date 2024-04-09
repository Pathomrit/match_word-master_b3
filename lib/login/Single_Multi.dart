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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlayPage()),
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
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Select Mode',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontFamily: 'TonphaiThin',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                      fontSize: 30.0,
                      fontFamily: 'TonphaiThin',
                      fontWeight: FontWeight.bold,
                    ),
                    borderColor: Colors.indigo.shade200,
                    borderWidth: 3.0,
                    buttonWidth: 250.0,
                    buttonHeight: 50.0,
                  ),
                  SizedBox(height: 20),
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
                      fontSize: 30.0,
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
