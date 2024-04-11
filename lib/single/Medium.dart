import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match_word/setting/DataSinglePlayer.dart';
import 'package:match_word/single/Level.dart';
class Medium extends StatefulWidget {
  @override
  _Medium createState() => _Medium();
}

class _Medium extends State<Medium> {
  List<String> picImages = [
    "Pic/Castle.png",
    "Pic/King.png",
    "Pic/Queen.png",
    "Pic/Wizard.png",
    "Pic/Knight.png",
    "Pic/Kid.png",
    "Pic/archer.png",
    "Pic/Castle.png",
    "Pic/King.png",
    "Pic/Queen.png",
    "Pic/Wizard.png",
    "Pic/Knight.png",
    "Pic/Kid.png",
    "Pic/archer.png",
    "Pic/Castle.png",
    "Pic/King.png",
    "Pic/Queen.png",
    "Pic/Wizard.png",
    "Pic/Knight.png",
    "Pic/Kid.png",
    "Pic/archer.png",
  ];

  List<String> wordImages = [
    "Word/Castle.png",
    "Word/King.png",
    "Word/Queen.png",
    "Word/Wizard.png",
    "Word/Knight.png",
    "Word/Kid.png",
    "Word/archer.png",
    "Word/Castle.png",
    "Word/King.png",
    "Word/Queen.png",
    "Word/Wizard.png",
    "Word/Knight.png",
    "Word/Kid.png",
    "Word/archer.png",
    "Word/Castle.png",
    "Word/King.png",
    "Word/Queen.png",
    "Word/Wizard.png",
    "Word/Knight.png",
    "Word/Kid.png",
    "Word/archer.png",
  ];

  List<String> playedWords = [
    "Castle",
    "King",
    "Queen",
    "Wizard",
    "Knight",
    "Kid",
    "Archer",
  ];

  List<bool> isFlipped = [];
  int maxTime = 45;
  int timeLeft = 0;
  int flips = 0;
  int matchedCard = 0;
  bool disableDeck = false;
  bool isPlaying = false;
  String cardOne = "";
  String cardTwo = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    shuffleCard();
  }

  void showResultDialog(bool isWin) {
    List<String> playedWordsList = isWin ? playedWords : picImages;
    bool showWords = false;
    double dialogHeight = MediaQuery.of(context).size.height * 0.2;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                padding: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width * 0.1,
                height: dialogHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        matchedCard == DataCountCardMedium.countCard.first.count_card ~/ 2 ? "You Win" : "You Lose",
                        style: TextStyle(
                          fontSize: 30,
                          color: matchedCard == DataCountCardMedium.countCard.first.count_card ~/ 2 ? Colors.green : Colors.red,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Total flips: ${flips ~/ 2}",
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
                        itemCount: playedWordsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              playedWordsList[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: 'TonphaiThin',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !showWords,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showWords = true;
                            dialogHeight = MediaQuery.of(context).size.height * 0.6;
                          });
                        },
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
                        shuffleCard();
                      },
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
                        Navigator.pop(context);
                        resumeTimer();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Level()),
                        );
                      },
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
              ],
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

  void initTimer() {
    if (timeLeft <= 0 || matchedCard == DataCountCardMedium.countCard.first.count_card ~/ 2) {
      timer?.cancel();
      if (matchedCard == DataCountCardMedium.countCard.first.count_card ~/ 2) {
        showResultDialog(true);
      } else {
        disableDeck = true;
        showResultDialog(false);
        Future.delayed(Duration(milliseconds: 500), () {
          disableDeck = false;
        });
      }
      return;
    }
    setState(() {
      timeLeft--;
    });
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void resumeTimer() {
    startTimer();
  }


  void flipCard(String clickedCard) {
    if (!isPlaying) {
      isPlaying = true;
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        initTimer();
      });
    }

    setState(() {
      flips++;
    });

    if (clickedCard != cardOne && !disableDeck && timeLeft > 0) {
      if (cardOne.isEmpty) {
        setState(() {
          cardOne = clickedCard;
        });
      } else {
        setState(() {
          cardTwo = clickedCard;
          disableDeck = true;
        });
        String cardOneImg = getImagePath(cardOne);
        String cardTwoImg = getImagePath(cardTwo);

        matchCards(cardOneImg, cardTwoImg);
      }
    }
  }

  String getImagePath(String cardIndex) {
    int index = int.parse(cardIndex);
    if (index <= picImages.length) {
      return 'assets/${picImages[index - 1]}';
    } else {
      return 'assets/${wordImages[index - picImages.length - 1]}';
    }
  }

  void matchCards(String img1, String img2) {
    List<String> img1Parts = img1.split('/');
    List<String> img2Parts = img2.split('/');

    if (img1Parts.last == img2Parts.last) {
      matchedCard++;
      setState(() {
        cardOne = "";
        cardTwo = "";
        disableDeck = false;
      });
    } else {
      Future.delayed(Duration(milliseconds: 500), () {
        if (isFlipped[int.parse(cardOne) - 1]) {
          setState(() {
            isFlipped[int.parse(cardOne) - 1] = false;
          });
        }
        if (isFlipped[int.parse(cardTwo) - 1]) {
          setState(() {
            isFlipped[int.parse(cardTwo) - 1] = false;
          });
        }
        setState(() {
          cardOne = "";
          cardTwo = "";
          disableDeck = false;
        });
      });
    }
  }

  void shuffleCard() {
    Random random = Random();
    List<int> randomPositions = [];

    while (randomPositions.length < DataCountCardMedium.countCard.first.count_card ~/ 2) {
      int randomPosition = random.nextInt(picImages.length);
      if (!randomPositions.contains(randomPosition)) {
        randomPositions.add(randomPosition);
      }
    }

    List<String> shuffledPicImages = [];
    List<String> shuffledWordImages = [];
    List<bool> isPic = [];

    for (int i = 0; i < DataCountCardMedium.countCard.first.count_card ~/ 2; i++) {
      isPic.add(random.nextBool());
    }

    for (int i = 0; i < DataCountCardMedium.countCard.first.count_card ~/ 2; i++) {
      if (isPic[i]) {
        shuffledPicImages.add(picImages[randomPositions[i]]);
        shuffledWordImages.add(wordImages[randomPositions[i]]);
      } else {
        shuffledPicImages.add(wordImages[randomPositions[i]]);
        shuffledWordImages.add(picImages[randomPositions[i]]);
      }
    }

    setState(() {
      picImages = shuffledPicImages;
      wordImages = shuffledWordImages;
      timeLeft = maxTime;
      flips = 0;
      matchedCard = 0;
      cardOne = "";
      cardTwo = "";
      timer?.cancel();
      isPlaying = false;
      isFlipped = List.filled(DataCountCardMedium.countCard.first.count_card, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medium Mode',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontFamily: 'TonphaiThin',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            pauseTimer();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  alignment: Alignment.center,
                  title: Text("Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'TonphaiThin',
                      fontWeight: FontWeight.bold,
                    ),),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resumeTimer();
                        },
                        child: Text('Resume',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resumeTimer();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Level()),
                          );
                        },
                        child: Text('Back To Menu',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/BgGame.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Time: $timeLeft',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'TonphaiThin',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DataColumCardMedium.count.first.column_card,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: DataCountCardMedium.countCard.first.count_card,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index < picImages.length + wordImages.length &&
                              !disableDeck &&
                              !isFlipped[index]) {
                            flipCard((index + 1).toString());
                            setState(() {
                              isFlipped[index] = true;
                            });
                          }
                        },
                        child: Container(
                          child: Transform.scale(
                            scale: 1.1,
                            child: InkWell(
                              child: isFlipped[index]
                                  ? Image.asset(
                                getImagePath((index + 1).toString()),
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/BgCard/Star.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}