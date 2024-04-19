import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match_word/setting/DataMultiPlayer.dart';
import 'package:match_word/multi/SelectPeople.dart';

class Two extends StatefulWidget {
  @override
  _Two createState() => _Two();
}

class _Two extends State<Two> {
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
  List<String> picImages = [
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
  int maxTime = 30;
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
    RandomBg();
    shuffleCard();
  }

  void showResultDialog(bool isWin) {
    String winner = currentPlayer == 'Player 1' ? 'Player 1' : 'Player 2';
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
                        matchedCard ==
                                DataCountCardTwo.countCard.first.count_card ~/ 2
                            ? "$winner Wins"
                            : "You Lose",
                        style: TextStyle(
                          fontSize: 30,
                          color: matchedCard ==
                                  DataCountCardTwo.countCard.first.count_card ~/
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
                      "Total flips: ${flips ~/ 2}",
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
                            dialogHeight =
                                MediaQuery.of(context).size.height * 0.6;
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
                          MaterialPageRoute(
                              builder: (context) => SelectPeople()),
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
    if (timeLeft <= 0 ||
        matchedCard == DataCountCardTwo.countCard.first.count_card ~/ 2) {
      timer?.cancel();
      if (matchedCard == DataCountCardTwo.countCard.first.count_card ~/ 2) {
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

  void showEnlargedImages(String imagePath1, String imagePath2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  imagePath1,
                  height: 200,
                  width: 150,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  imagePath2,
                  height: 200,
                  width: 150,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void resumeTimer() {
    startTimer();
  }

  String currentPlayer = 'Player 1';

  void flipCard(String clickedCard) {
    if (!isPlaying && !disableDeck) {
      isPlaying = true;
      startTimer();
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

        showEnlargedImages(cardOneImg, cardTwoImg);
        Future.delayed(Duration(milliseconds: 500), () {
          matchCards(cardOneImg, cardTwoImg);
          Navigator.of(context).pop();
        });
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
          currentPlayer = currentPlayer == 'Player 1' ? 'Player 2' : 'Player 1';
          timeLeft = maxTime;
        });
      });
    }
  }

  void shuffleCard() {
    Random random = Random();
    List<int> randomPositions = [];

    while (randomPositions.length <
        DataCountCardTwo.countCard.first.count_card ~/ 2) {
      int randomPosition = random.nextInt(picImages.length);
      if (!randomPositions.contains(randomPosition)) {
        randomPositions.add(randomPosition);
      }
    }

    List<String> shuffledPicImages = [];
    List<String> shuffledWordImages = [];
    List<bool> isPic = [];

    for (int i = 0; i < DataCountCardTwo.countCard.first.count_card ~/ 2; i++) {
      isPic.add(random.nextBool());
    }

    for (int i = 0; i < DataCountCardTwo.countCard.first.count_card ~/ 2; i++) {
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
      isFlipped =
          List.filled(DataCountCardTwo.countCard.first.count_card, false);
    });
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
                        color: currentPlayer == 'Player 1' ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 1',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 1' ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: currentPlayer == 'Player 2' ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Player 2',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.bold,
                          color: currentPlayer == 'Player 2' ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: RichText(
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
                          text: '$timeLeft',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                            color: timeLeft < 6 ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DataColumCardTwo.count.first.column_card,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: DataCountCardTwo.countCard.first.count_card,
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
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: InkWell(
                            child: isFlipped[index]
                                ? Image.asset(
                              getImagePath((index + 1).toString()),
                              fit: BoxFit.cover,
                            )
                                : Image.asset(
                              'assets/BgCard/bgCard.png',
                              fit: BoxFit.cover,
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
                      return AlertDialog(
                        alignment: Alignment.center,
                        title: Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontFamily: 'TonphaiThin',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                resumeTimer();
                              },
                              child: Text(
                                'Resume',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'TonphaiThin',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                resumeTimer();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SelectPeople()),
                                );
                              },
                              child: Text(
                                'Back To Menu',
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
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 60),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Two Player',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontFamily: 'TonphaiThin',
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

class EnlargedImage extends StatelessWidget {
  final String imagePath;

  const EnlargedImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
