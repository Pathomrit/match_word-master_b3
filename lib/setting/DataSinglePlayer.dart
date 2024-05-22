import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_word/setting/Setting.dart';
import 'package:match_word/single/Level.dart';

class SinglePlayerSetting extends StatefulWidget {
  SinglePlayerSetting({Key? key}) : super(key: key);

  @override
  _SinglePlayerSetting createState() => _SinglePlayerSetting();
}

class DataColumCardEasy {
  static List<InputColumnEasy> count = [InputColumnEasy(column_card: 4)];
}

class DataCountCardEasy {
  static List<InputCardEasy> countCard = [InputCardEasy(count_card: 12)];
}

class DataColumCardMedium {
  static List<InputColumnMedium> count = [InputColumnMedium(column_card: 5)];
}

class DataCountCardMedium {
  static List<InputCardMedium> countCard = [InputCardMedium(count_card: 16)];
}

class DataColumCardHard {
  static List<InputColumnHard> count = [InputColumnHard(column_card: 6)];
}

class DataCountCardHard {
  static List<InputCardHard> countCard = [InputCardHard(count_card: 20)];
}

class _SinglePlayerSetting extends State<SinglePlayerSetting> {
  TextEditingController _columnControllerEasy = TextEditingController();
  TextEditingController _countControllerEasy = TextEditingController();
  TextEditingController _columnControllerMedium = TextEditingController();
  TextEditingController _countControllerMedium = TextEditingController();
  TextEditingController _columnControllerHard = TextEditingController();
  TextEditingController _countControllerHard = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting",
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgSetting.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Easy Mode Setting",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 60,
                              color: Colors.black,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _columnControllerEasy,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Column card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerEasy,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Sum card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("Medium Mode Setting",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 60,
                              color: Colors.black,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _columnControllerMedium,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Column card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerMedium,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Sum card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("Hard Mode Setting",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 60,
                              color: Colors.black,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _columnControllerHard,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Column card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerHard,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Sum card',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontFamily: 'TonphaiThin',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            String columnTextEasy =
                            _columnControllerEasy.text.isNotEmpty
                                ? _columnControllerEasy.text
                                : "4";
                            String countTextEasy =
                            _countControllerEasy.text.isNotEmpty
                                ? _countControllerEasy.text
                                : "12";
                            String columnTextMedium =
                            _columnControllerMedium.text.isNotEmpty
                                ? _columnControllerMedium.text
                                : "5";
                            String countTextMedium =
                            _countControllerMedium.text.isNotEmpty
                                ? _countControllerMedium.text
                                : "16";
                            String columnTextHard =
                            _columnControllerHard.text.isNotEmpty
                                ? _columnControllerHard.text
                                : "6";
                            String countTextHard =
                            _countControllerHard.text.isNotEmpty
                                ? _countControllerHard.text
                                : "20";

                            int countCardEasy = int.parse(countTextEasy);
                            int countCardMedium = int.parse(countTextMedium);
                            int countCardHard = int.parse(countTextHard);
                            if (countCardEasy % 2 == 0 &&
                                countCardMedium % 2 == 0 &&
                                countCardHard % 2 == 0) {
                              InputCardEasy inputDataCardEasy =
                              InputCardEasy(count_card: countCardEasy);
                              DataCountCardEasy.countCard = [inputDataCardEasy];
                              InputCardMedium inputDataCardMedium =
                              InputCardMedium(count_card: countCardMedium);
                              DataCountCardMedium.countCard = [
                                inputDataCardMedium
                              ];
                              InputCardHard inputDataCardHard =
                              InputCardHard(count_card: countCardHard);
                              DataCountCardHard.countCard = [inputDataCardHard];
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Level()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text("Please enter even number"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            InputColumnEasy inputDataEasy = InputColumnEasy(
                                column_card: int.parse(columnTextEasy));
                            DataColumCardEasy.count = [inputDataEasy];
                            InputColumnMedium inputDataMedium = InputColumnMedium(
                                column_card: int.parse(columnTextMedium));
                            DataColumCardMedium.count = [inputDataMedium];
                            InputColumnHard inputDataHard = InputColumnHard(
                                column_card: int.parse(columnTextHard));
                            DataColumCardHard.count = [inputDataHard];
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontFamily: 'TonphaiThin',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            InputColumnEasy defaultInputDataEasy =
                            InputColumnEasy(column_card: 4);
                            DataColumCardEasy.count = [defaultInputDataEasy];
                            _columnControllerEasy.clear();
                            InputCardEasy defaultInputDataCardEasy =
                            InputCardEasy(count_card: 12);
                            DataCountCardEasy.countCard = [
                              defaultInputDataCardEasy
                            ];
                            _countControllerEasy.clear();
                            InputColumnMedium defaultInputDataMedium =
                            InputColumnMedium(column_card: 5);
                            DataColumCardMedium.count = [defaultInputDataMedium];
                            _columnControllerMedium.clear();
                            InputCardMedium defaultInputDataCardMedium =
                            InputCardMedium(count_card: 16);
                            DataCountCardMedium.countCard = [
                              defaultInputDataCardMedium
                            ];
                            _countControllerMedium.clear();
                            InputColumnHard defaultInputDataHard =
                            InputColumnHard(column_card: 6);
                            DataColumCardHard.count = [defaultInputDataHard];
                            _columnControllerHard.clear();
                            InputCardHard defaultInputDataCardHard =
                            InputCardHard(count_card: 20);
                            DataCountCardHard.countCard = [
                              defaultInputDataCardHard
                            ];
                            _countControllerHard.clear();
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'TonphaiThin',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      MaterialPageRoute(builder: (context) => Level()),
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
