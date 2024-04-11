import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_word/setting/DataSinglePlayer.dart';
import 'package:match_word/multi/fourpeople/Four.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bluegradient.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Setting Mode",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  height: 3,
                  fontFamily: 'TonphaiThin',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundedButton(
                  'Single',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SinglePlayerSetting()),
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
                  buttonWidth: 100.0,
                  buttonHeight: 50.0,
                ),
                SizedBox(height: 15.0),
                RoundedButton(
                  'Multi',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Four()),
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
                  buttonWidth: 100.0,
                  buttonHeight: 50.0,
                ),
                SizedBox(height: 15.0),
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
