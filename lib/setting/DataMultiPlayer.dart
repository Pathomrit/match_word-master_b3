import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_word/multi/SelectPeople.dart';
import 'package:match_word/setting/Setting.dart';

class MultiPlayerSetting extends StatefulWidget{
  MultiPlayerSetting({Key? key}) : super(key: key);
  @override
  _MultiPlayerSetting createState() => _MultiPlayerSetting();

}
class DataColumCardTwo {
  static List<InputColumnTwo> count = [
    InputColumnTwo(column_card: 4)
  ];
}

class DataCountCardTwo {
  static List<InputCardTwo> countCard = [
    InputCardTwo(count_card: 12)
  ];
}
class DataColumCardThree {
  static List<InputColumnThree> count = [
    InputColumnThree(column_card: 4)
  ];
}

class DataCountCardThree {
  static List<InputCardThree> countCard = [
    InputCardThree(count_card: 16)
  ];
}
class DataColumCardFour {
  static List<InputColumnFour> count = [
    InputColumnFour(column_card: 6)
  ];
}

class DataCountCardFour {
  static List<InputCardFour> countCard = [
    InputCardFour(count_card: 20)
  ];
}


class _MultiPlayerSetting extends State<MultiPlayerSetting> {
  TextEditingController _columnControllerTwo = TextEditingController();
  TextEditingController _countControllerTwo = TextEditingController();
  TextEditingController _columnControllerThree = TextEditingController();
  TextEditingController _countControllerThree= TextEditingController();
  TextEditingController _columnControllerFour = TextEditingController();
  TextEditingController _countControllerFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SelectPeople()),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bluegradient.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Two Player Mode Setting", style: TextStyle(fontSize: 30 ,fontFamily: 'TonphaiThin', fontWeight: FontWeight.bold)),
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
                                controller: _columnControllerTwo,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Column card',
                                  border: OutlineInputBorder(),
                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _countControllerTwo,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Count card',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text("Three Player Mode Setting", style: TextStyle(fontSize: 30,fontFamily: 'TonphaiThin', fontWeight: FontWeight.bold)),
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
                                controller: _columnControllerThree,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Column card',
                                  border: OutlineInputBorder(),
                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _countControllerThree,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Count card',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text("Four Player Mode Setting", style: TextStyle(fontSize: 30,fontFamily: 'TonphaiThin', fontWeight: FontWeight.bold)),
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
                                controller: _columnControllerFour,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Column card',
                                  border: OutlineInputBorder(),
                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _countControllerFour,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter Count card',
                                  border: OutlineInputBorder(),
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
                          String columnTextTwo = _columnControllerTwo.text.isNotEmpty ? _columnControllerTwo.text : "4";
                          String countTextTwo = _countControllerTwo.text.isNotEmpty ? _countControllerTwo.text : "12";
                          InputColumnTwo inputDataTwo = InputColumnTwo(column_card: int.parse(columnTextTwo));
                          DataColumCardTwo.count = [inputDataTwo];
                          InputCardTwo inputDataCardTwo = InputCardTwo(count_card: int.parse(countTextTwo));
                          DataCountCardTwo.countCard = [inputDataCardTwo];
                          String columnTextThree = _columnControllerThree.text.isNotEmpty ? _columnControllerThree.text : "4";
                          String countTextThree = _countControllerThree.text.isNotEmpty ? _countControllerThree.text : "16";
                          InputColumnThree inputDataThree = InputColumnThree(column_card: int.parse(columnTextThree));
                          DataColumCardThree.count = [inputDataThree];
                          InputCardThree inputDataCardThree = InputCardThree(count_card: int.parse(countTextThree));
                          DataCountCardThree.countCard = [inputDataCardThree];
                          String columnTextFour = _columnControllerFour.text.isNotEmpty ? _columnControllerFour.text : "4";
                          String countTextFour = _countControllerFour.text.isNotEmpty ? _countControllerFour.text : "20";
                          InputColumnFour inputDataFour = InputColumnFour(column_card: int.parse(columnTextFour));
                          DataColumCardFour.count = [inputDataFour];
                          InputCardFour inputDataCardFour = InputCardFour(count_card: int.parse(countTextFour));
                          DataCountCardFour.countCard = [inputDataCardFour];
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectPeople()),
                          );
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
                          InputColumnTwo defaultInputDataTwo = InputColumnTwo(column_card: 4);
                          DataColumCardTwo.count = [defaultInputDataTwo];
                          _columnControllerTwo.clear();
                          InputCardTwo defaultInputDataCardTwo = InputCardTwo(count_card: 12);
                          DataCountCardTwo.countCard = [defaultInputDataCardTwo];
                          _countControllerTwo.clear();
                          InputColumnThree defaultInputDataThree = InputColumnThree(column_card: 4);
                          DataColumCardThree.count = [defaultInputDataThree];
                          _columnControllerThree.clear();
                          InputCardThree defaultInputDataCardThree = InputCardThree(count_card: 16);
                          DataCountCardThree.countCard = [defaultInputDataCardThree];
                          _countControllerThree.clear();
                          InputColumnFour defaultInputDataFour = InputColumnFour(column_card: 6);
                          DataColumCardFour.count = [defaultInputDataFour];
                          _columnControllerFour.clear();
                          InputCardFour defaultInputDataCardFour = InputCardFour(count_card: 20);
                          DataCountCardFour.countCard = [defaultInputDataCardFour];
                          _countControllerFour.clear();
                        },
                        child: Text('Reset',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'TonphaiThin',
                              fontWeight: FontWeight.bold
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
      ),
    );
  }
}
