import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_word/login/Single_Multi.dart';
import 'package:match_word/multi/SelectPeople.dart';
import 'package:match_word/setting/Setting.dart';

class MultiPlayerSetting extends StatefulWidget {
  MultiPlayerSetting({Key? key}) : super(key: key);

  @override
  _MultiPlayerSetting createState() => _MultiPlayerSetting();
}

class DataColumCardTwo {
  static List<InputColumnTwo> count = [InputColumnTwo(column_card: 4)];
}

class DataCountCardTwo {
  static List<InputCardTwo> countCard = [InputCardTwo(count_card: 12)];
}

class DataColumCardThree {
  static List<InputColumnThree> count = [InputColumnThree(column_card: 6)];
}

class DataCountCardThree {
  static List<InputCardThree> countCard = [InputCardThree(count_card: 16)];
}

class DataColumCardFour {
  static List<InputColumnFour> count = [InputColumnFour(column_card: 6)];
}

class DataCountCardFour {
  static List<InputCardFour> countCard = [InputCardFour(count_card: 20)];
}

class _MultiPlayerSetting extends State<MultiPlayerSetting> {
  TextEditingController _countControllerTwo = TextEditingController();
  TextEditingController _countControllerThree = TextEditingController();
  TextEditingController _countControllerFour = TextEditingController();
  int _selectedColumnCardTwo = 4;
  int _selectedColumnCardThree = 6;
  int _selectedColumnCardFour = 6;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    Text("Two Player Mode Setting",
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
                              Text(
                                "Columns",
                                style: TextStyle(
                                  fontSize: 22,
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
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: DropdownButtonFormField<int>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  value: _selectedColumnCardTwo,
                                  items: [4, 6, 8, 10].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        '$value Columns',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedColumnCardTwo = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Spacer between sections
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cards",
                                style: TextStyle(
                                  fontSize: 22,
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
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerTwo,
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
                    Text("Three Player Mode Setting",
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
                              Text(
                                "Columns",
                                style: TextStyle(
                                  fontSize: 22,
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
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: DropdownButtonFormField<int>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  value: _selectedColumnCardThree,
                                  items: [4, 6, 8, 10].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        '$value Columns',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedColumnCardThree = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Spacer between sections
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cards",
                                style: TextStyle(
                                  fontSize: 22,
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
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerThree,
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
                    Text("Four Player Mode Setting",
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
                              Text(
                                "Columns",
                                style: TextStyle(
                                  fontSize: 22,
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
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: DropdownButtonFormField<int>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  value: _selectedColumnCardFour,
                                  items: [4, 6, 8, 10].map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        '$value Columns',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedColumnCardFour = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Spacer between sections
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cards",
                                style: TextStyle(
                                  fontSize: 22,
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
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: _countControllerFour,
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
                            String columnTextTwo = _selectedColumnCardTwo.toString();
                            String countTextTwo =
                                _countControllerTwo.text.isNotEmpty
                                    ? _countControllerTwo.text
                                    : "12";
                            String columnTextThree = _selectedColumnCardThree.toString();
                            String countTextThree =
                                _countControllerThree.text.isNotEmpty
                                    ? _countControllerThree.text
                                    : "16";
                            String columnTextFour =  _selectedColumnCardFour.toString();
                            String countTextFour =
                                _countControllerFour.text.isNotEmpty
                                    ? _countControllerFour.text
                                    : "20";

                            int countCardTwo = int.parse(countTextTwo);
                            int countCardThree = int.parse(countTextThree);
                            int countCardFour = int.parse(countTextFour);
                            if (countCardTwo % 2 == 0 &&
                                countCardThree % 2 == 0 &&
                                countCardFour % 2 == 0 &&
                                countCardTwo <= 40 &&
                                countCardThree <= 40 &&
                                countCardFour <= 40) {
                              InputCardTwo inputDataCardTwo =
                                  InputCardTwo(count_card: countCardTwo);
                              DataCountCardTwo.countCard = [inputDataCardTwo];
                              InputCardThree inputDataCardThree =
                                  InputCardThree(count_card: countCardThree);
                              DataCountCardThree.countCard = [
                                inputDataCardThree
                              ];
                              InputCardFour inputDataCardFour =
                                  InputCardFour(count_card: countCardFour);
                              DataCountCardFour.countCard = [inputDataCardFour];
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectPeople()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/hamster_coffee.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Warning",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Please enter only even numbers or not more than 40",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 0),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFE4F8BA),
                                                onPrimary: Colors.black,
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(10.0),
                                                minimumSize: Size(16, 16),
                                              ),
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'TonphaiThin',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            InputColumnTwo inputDataTwo = InputColumnTwo(
                                column_card: int.parse(columnTextTwo));
                            DataColumCardTwo.count = [inputDataTwo];
                            InputColumnThree inputDataThree = InputColumnThree(
                                column_card: int.parse(columnTextThree));
                            DataColumCardThree.count = [inputDataThree];
                            InputColumnFour inputDataFour = InputColumnFour(
                                column_card: int.parse(columnTextFour));
                            DataColumCardFour.count = [inputDataFour];
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            side: BorderSide(color: Colors.indigo.shade200, width: 3),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontFamily: 'PandaThin',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            InputColumnTwo defaultInputDataTwo =
                                InputColumnTwo(column_card: _selectedColumnCardTwo);
                            DataColumCardTwo.count = [defaultInputDataTwo];
                            InputCardTwo defaultInputDataCardTwo =
                                InputCardTwo(count_card: 12);
                            DataCountCardTwo.countCard = [
                              defaultInputDataCardTwo
                            ];
                            _countControllerTwo.clear();
                            InputColumnThree defaultInputDataThree =
                                InputColumnThree(column_card: _selectedColumnCardThree);
                            DataColumCardThree.count = [defaultInputDataThree];
                            InputCardThree defaultInputDataCardThree =
                                InputCardThree(count_card: 16);
                            DataCountCardThree.countCard = [
                              defaultInputDataCardThree
                            ];
                            _countControllerThree.clear();
                            InputColumnFour defaultInputDataFour =
                                InputColumnFour(column_card: _selectedColumnCardFour);
                            DataColumCardFour.count = [defaultInputDataFour];
                            InputCardFour defaultInputDataCardFour =
                                InputCardFour(count_card: 20);
                            DataCountCardFour.countCard = [
                              defaultInputDataCardFour
                            ];
                            _countControllerFour.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            side: BorderSide(color: Colors.indigo.shade200, width: 3),
                          ),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PandaThin',
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
                      MaterialPageRoute(builder: (context) => SingleOrMulti()),
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
