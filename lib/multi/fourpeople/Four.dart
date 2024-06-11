import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match_word/single/Level.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join, getDatabasesPath;
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:match_word/multi/SelectPeople.dart';
import 'package:match_word/setting/DataMultiPlayer.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'Vword3.sqlite';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    print('Database path: $path');
    await _copyDatabase(dbName);
    return await openDatabase(path, version: 1);
  }

  Future<void> _copyDatabase(String dbName) async {
    String path = join(await getDatabasesPath(), dbName);
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load('assets/$dbName');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
  }
}

class CardData {
  String word;
  String imageData;

  CardData({required this.word, required this.imageData});
}

class Four extends StatefulWidget {
  @override
  _Four createState() => _Four();
}

class _Four extends State<Four> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> initDatabase() async {
    await databaseHelper.initDatabase();
  }

  Future<List<Map<String, dynamic>>> fetchRandomData() async {
    final Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> data = await db.query(
      'Hard',
      columns: ['Word', 'picImages', 'wordImages', 'Meaning'],
    );

    List<int> indices = List<int>.generate(data.length, (int index) => index);
    indices.shuffle();
    List<String> randomWords = [];
    List<String> randomPicImages = [];
    List<String> randomWordImages = [];
    List<String> randomMeanings = [];

    for (int i = 0;
        i < DataCountCardFour.countCard.first.count_card ~/ 2;
        i++) {
      int currentIndex = indices[i];
      randomWords.add(data[currentIndex]['Word']);
      Uint8List picBytes = data[currentIndex]['picImages'];
      String picImageData = base64Encode(picBytes);
      randomPicImages.add(picImageData);
      Uint8List wordBytes = data[currentIndex]['wordImages'];
      String wordImageData = base64Encode(wordBytes);
      randomWordImages.add(wordImageData);
      randomMeanings.add(data[currentIndex]['Meaning']);
    }
    List<Map<String, dynamic>> randomData = [];
    for (int i = 0;
        i < DataCountCardFour.countCard.first.count_card ~/ 2;
        i++) {
      randomData.add({
        'Word': randomWords[i],
        'picImages': randomPicImages[i],
        'wordImages': randomWordImages[i],
        'Meaning': randomMeanings[i],
      });
    }

    return randomData;
  }

  String selectedBgImage = '';

  void RandomBg() {
    List<String> bgImages = [
      'assets/images/BgGame.png',
      'assets/images/BgGame1.png',
      'assets/images/GbGame2.png',
    ];
    Random randomBg = Random();
    int bgIndex = randomBg.nextInt(bgImages.length);
    selectedBgImage = bgImages[bgIndex];
  }

  List<int> selectedCards = [];
  List<String> picImages = [];
  List<String> wordImages = [];
  List<String> playedWords = [];
  List<String> word = [];
  List<String> meaning = [];
  List<bool> isFlipped = [];
  int maxTime = 30;
  int timeLeft = 0;
  int flips = 0;
  int matchedCard = 0;
  bool disableDeck = false;
  bool isPlaying = false;
  String cardOne = "";
  String cardTwo = "";
  Timer? timer;
  List<String> picGame = [];

  @override
  void initState() {
    super.initState();
    timeLeft = maxTime;
    matchedCard = 0;
    disableDeck = false;
    isResultDialogShowing = false;
    shuffleCard();
    RandomBg();
  }

  void shuffleCard() {
    fetchRandomData().then((data) {
      List<String> fetchedWords = [];
      List<String> fetchedPicImages = [];
      List<String> fetchedWordImages = [];
      List<String> fetchedMeaning = [];
      data.forEach((item) {
        fetchedWords.add(item['Word']);
        Uint8List picBytes = base64Decode(item['picImages']);
        String picImageData = base64Encode(picBytes);
        fetchedPicImages.add(picImageData);
        Uint8List wordBytes = base64Decode(item['wordImages']);
        String wordImageData = base64Encode(wordBytes);
        fetchedWordImages.add(wordImageData);
        fetchedMeaning.add(item['Meaning']);
        word.add(item['Word']);
        meaning.add(item['Meaning']);
      });
      List<int> indices =
          List<int>.generate(fetchedWords.length, (int index) => index);
      indices.shuffle();
      List<String> shuffledWords = [];
      List<String> shuffledPicImages = [];
      List<String> shuffledWordImages = [];
      for (int i = 0; i < indices.length; i++) {
        shuffledWords.add(fetchedWords[indices[i]]);
        shuffledPicImages.add(fetchedPicImages[indices[i]]);
        shuffledWordImages.add(fetchedWordImages[indices[i]]);
      }
      setState(() {
        timeLeft = maxTime;
        picImages = shuffledPicImages
            .take(DataCountCardFour.countCard.first.count_card ~/ 2)
            .toList();
        wordImages = shuffledWordImages
            .take(DataCountCardFour.countCard.first.count_card ~/ 2)
            .toList();
        List<CardData> combinedData = [];
        for (int i = 0; i < picImages.length; i++) {
          combinedData.add(CardData(
              word: shuffledWords[i], imageData: shuffledPicImages[i]));
          combinedData.add(CardData(
              word: shuffledWords[i], imageData: shuffledWordImages[i]));
        }
        combinedData.shuffle();
        picGame = combinedData.map((data) => data.imageData).toList();
        playedWords = combinedData.map((data) => data.word).toList();
        isFlipped = List<bool>.filled(picGame.length, false);
        timer?.cancel();
        isPlaying = false;
        flips = 0;
        matchedCard = 0;
      });
    });
  }

  String currentPlayer = 'Player 1';

  void showResultDialog(bool isWin) async {
    String winner;
    bool showWords = false;
    double dialogHeight = MediaQuery.of(context).size.height * 0.3;

    if (player1Score > 0 && player1Score > player2Score && player1Score > player3Score && player1Score > player4Score) {
      winner = 'Player 1 Win';
    } else if (player2Score > 0 && player2Score > player1Score && player2Score > player3Score && player2Score > player4Score) {
      winner = 'Player 2 Win';
    } else if (player3Score > 0 && player3Score > player1Score && player3Score > player2Score && player3Score > player4Score) {
      winner = 'Player 3 Win';
    } else if (player4Score > 0 && player4Score > player1Score && player4Score > player2Score && player4Score > player3Score) {
      winner = 'Player 4 Win';
    } else if (player1Score == player2Score && player1Score == player3Score && player1Score == player4Score && player1Score > 0) {
      winner = 'Draw';
    } else if (player1Score == player2Score && player1Score == player3Score && player1Score > 0) {
      winner = 'P1, P2 and P3 Win';
    } else if (player1Score == player2Score && player1Score == player4Score && player1Score > 0) {
      winner = 'P1, P2 and P4 Win';
    } else if (player1Score == player3Score && player1Score == player4Score && player1Score > 0) {
      winner = 'P1, P3 and P4 Win';
    } else if (player2Score == player3Score && player2Score == player4Score && player2Score > 0) {
      winner = 'P2, P3 and P4 Win';
    } else if (player1Score == player2Score && player1Score > 0) {
      winner = 'P1 and P2 Win';
    } else if (player1Score == player3Score && player1Score > 0) {
      winner = 'P1 and P3 Win';
    } else if (player1Score == player4Score && player1Score > 0) {
      winner = 'P1 and P4 Win';
    } else if (player2Score == player3Score && player2Score > 0) {
      winner = 'P2 and P3 Win';
    } else if (player2Score == player4Score && player2Score > 0) {
      winner = 'P2 and P4 Win';
    } else if (player3Score == player4Score && player3Score > 0) {
      winner = 'P3 and P4 Win';
    } else {
      winner = 'Draw';
    }
    if (word.isEmpty || meaning.isEmpty) {
      await fetchRandomData();
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: dialogHeight,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/images/kid_ontheground.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              matchedCard ==
                                  DataCountCardFour
                                      .countCard.first.count_card ~/
                                      2
                                  ? "$winner"
                                  : "$winner",
                              style: TextStyle(
                                fontSize: 30,
                                color: matchedCard ==
                                    DataCountCardFour
                                        .countCard.first.count_card ~/
                                        2
                                    ? Colors.green
                                    : Colors.red,
                                fontFamily: 'TonphaiThin',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Player 1 Score : $player1Score\nPlayer 2 Score : $player2Score\nPlayer 3 Score : $player3Score\nPlayer 4 Score : $player4Score",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'TonphaiThin',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: showWords
                                ? ListView.builder(
                              itemCount: word.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(
                                    '${word[index]} = ${meaning[index]}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'PandaThin',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            )
                                : SizedBox(),
                          ),
                          showWords ? SizedBox(height: 20) : SizedBox(),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: !showWords,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showWords = true;
                                    dialogHeight =
                                        MediaQuery.of(context).size.height *
                                            0.6;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFE4F8BA),
                                  onPrimary: Colors.black,
                                  side: BorderSide(color: Colors.green, width: 2),
                                ),
                                child: Text(
                                  "Words",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'TonphaiThin',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  isResultDialogShowing = false;
                                  timeLeft = maxTime;
                                  timerValueNotifier.value = timeLeft;
                                  currentPlayer = 'Player 1';
                                  player1Score = 0;
                                  player2Score = 0;
                                  player3Score = 0;
                                  player4Score = 0;
                                  RandomBg();
                                });
                                word.clear();
                                meaning.clear();
                                shuffleCard();
                                startTimer();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE4F8BA),
                                onPrimary: Colors.black,
                                side: BorderSide(color: Colors.green, width: 2),
                              ),
                              child: Text(
                                "Retry",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'TonphaiThin',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  isResultDialogShowing = false;
                                });
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectPeople()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE4F8BA),
                                onPrimary: Colors.black,
                                side: BorderSide(color: Colors.green, width: 2),
                              ),
                              child: Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'TonphaiThin',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      initTimer();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool isResultDialogShowing = false;
  ValueNotifier<int> timerValueNotifier = ValueNotifier<int>(30);

  void initTimer() {
    if (!mounted) return;
    if (timeLeft <= 0 ||
        matchedCard == DataCountCardFour.countCard.first.count_card ~/ 2) {
      timer?.cancel();
      if (mounted && !isResultDialogShowing) {
        isResultDialogShowing = true;
        if (matchedCard == DataCountCardFour.countCard.first.count_card ~/ 2) {
          showResultDialog(true);
        } else {
          disableDeck = true;
          showResultDialog(false);
          Future.delayed(Duration(milliseconds: 500), () {
            if (mounted) {
              disableDeck = false;
              isResultDialogShowing = false;
            }
          });
        }
      }
      return;
    }
    timeLeft--;
    timerValueNotifier.value = timeLeft;
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void resumeTimer() {
    startTimer();
  }

  void showEnlargedImage(String base64Image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.memory(
              base64Decode(base64Image),
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
  int player1Score = 0;
  int player2Score = 0;
  int player3Score = 0;
  int player4Score = 0;
  void onTapCard(int index) async {
    if (index == -1) {
      if (selectedCards.length == 1) {
        setState(() {
          cardOne = "";
          isFlipped[selectedCards[0]] = false;
          selectedCards.clear();
        });
      }
      currentPlayer = getNextPlayer(currentPlayer);
      setState(() {
        timeLeft = maxTime;
        timerValueNotifier.value = timeLeft;
      });
      return;
    }
    if (!disableDeck &&
        !isFlipped[index] &&
        index >= 0 &&
        index < picGame.length &&
        timeLeft > 0) {
      if (!isPlaying) {
        isPlaying = true;
        timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
          initTimer();
        });
      }

      setState(() {
        flips += 1;
        isFlipped[index] = true;
        selectedCards.add(index);
      });

      await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.memory(
                    base64Decode(picGame[index]),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                IconButton(
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: 60,
                    height: 60,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );

      if (cardOne.isEmpty) {
        cardOne = playedWords[index];
      } else if (cardTwo.isEmpty) {
        cardTwo = playedWords[index];
        print("Card One: $cardOne");
        print("Card Two: $cardTwo");

        if (cardOne != cardTwo) {
          await Future.delayed(Duration(milliseconds: 300));
          setState(() {
            for (int selectedIndex in selectedCards) {
              isFlipped[selectedIndex] = false;
            }
            timeLeft = maxTime;
            timerValueNotifier.value = timeLeft;
            currentPlayer = getNextPlayer(currentPlayer);
          });
        } else {
          matchedCard += 1;
          setState(() {
            if (currentPlayer == 'Player 1') {
              player1Score += 1;
            } else if (currentPlayer == 'Player 2') {
              player2Score += 1;
            } else if (currentPlayer == 'Player 3') {
              player3Score += 1;
            }else if (currentPlayer == 'Player 4'){
              player4Score += 1;
            }
          });

          print(matchedCard);
          if (matchedCard == DataCountCardFour.countCard.first.count_card ~/ 2) {
            if (!isResultDialogShowing) {
              isResultDialogShowing = true;
              await Future.delayed(Duration(milliseconds: 300));
              showResultDialog(true);
            }
          }
        }
        await Future.delayed(Duration(milliseconds: 300));
        setState(() {
          cardOne = "";
          cardTwo = "";
          selectedCards.clear();
        });
      }
    }
  }

  String getNextPlayer(String currentPlayer) {
    if (currentPlayer == 'Player 1') {
      return 'Player 2';
    } else if (currentPlayer == 'Player 2') {
      return 'Player 3';
    } else if(currentPlayer == 'Player 3'){
      return 'Player 4';
    }else {
      return 'Player 1';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              selectedBgImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: currentPlayer == 'Player 1'
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 1\nScore : $player1Score',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 1'
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: currentPlayer == 'Player 2'
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 2\nScore : $player2Score',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 2'
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F7C9),
                    border: Border.all(color: Colors.black, width: 5.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ValueListenableBuilder<int>(
                    valueListenable: timerValueNotifier,
                    builder: (context, value, child) {
                      return RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Time: ',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'TonphaiThin',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: '$value',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'TonphaiThin',
                                fontWeight: FontWeight.bold,
                                color: value < 6 ? Colors.red : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF6B7AA1).withOpacity(0.1), width: 5.0),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF6B7AA1).withOpacity(0.50),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DataColumCardFour.count.first.column_card,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: picGame.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          onTapCard(index);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: isFlipped[index]
                              ? Image.memory(
                                  base64Decode(picGame[index]),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/BgCard/bgCard.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: currentPlayer == 'Player 3'
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 3\nScore : $player3Score',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 3'
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child:  IconButton(
                        icon: Image.asset(
                          'assets/images/Skip.png',
                          width: 60,
                          height: 60,
                        ),
                        onPressed: () {
                          onTapCard(-1);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: currentPlayer == 'Player 4'
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 4\nScore : $player4Score',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 4'
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              IconButton(
                padding: EdgeInsets.only(top: 30),
                icon: Image.asset(
                  'assets/images/pause.png',
                  width: 40,
                  height: 40,
                ),
                onPressed: () {
                  pauseTimer();
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
                              image:
                                  AssetImage('assets/images/kid_colorful.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Menu",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50.0,
                                    fontFamily: 'DANKI',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    resumeTimer();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFE4F8BA),
                                    onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 12.0),
                                  ),
                                  child: Text(
                                    'Resume',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'PandaThin',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    resumeTimer();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectPeople()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFE4F8BA),
                                    onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 12.0),
                                  ),
                                  child: Text(
                                    'Back To Menu',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'PandaThin',
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
                },
              ),
              SizedBox(width: 40),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Four Players',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontFamily: 'DANKI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
