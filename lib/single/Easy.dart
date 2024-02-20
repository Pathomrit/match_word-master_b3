import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Easy extends StatefulWidget {
  @override
  _Easy createState() => _Easy();
}

class _Easy extends State<Easy> {
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
    shuffleCard();
  }
  void showResultDialog(bool isWin) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              matchedCard == 6 ? "You Win" : "You Lose",
              style: TextStyle(
                color: matchedCard == 6 ? Colors.green : Colors.red,
              ),
            ),
          ),
          content: Text("Total flips: $flips"), // เพิ่มปุ่มแสดงจำนวนการ flip ที่นี่
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                shuffleCard();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }


  void initTimer() {
    if (timeLeft <= 0 || matchedCard == 6) {
      timer?.cancel();
      if (matchedCard == 6) {
        showResultDialog(true); // แสดงผลว่าชนะ
      } else {
        disableDeck = true;
        showResultDialog(false); // แสดงผลว่าแพ้
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


  void flipCard(String clickedCard) {
    if (!isPlaying) {
      isPlaying = true;
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        initTimer();
      });
    }

    setState(() {
      flips++;
      flips/2;
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
      Future.delayed(Duration(milliseconds: 400), () {
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

    while (randomPositions.length < 6) {
      int randomPosition = random.nextInt(picImages.length);
      if (!randomPositions.contains(randomPosition)) {
        randomPositions.add(randomPosition);
      }
    }

    List<String> shuffledPicImages = [];
    List<String> shuffledWordImages = [];
    List<bool> isPic = []; // เพิ่มตัวแปรเพื่อเก็บข้อมูลว่าแต่ละการ์ดควรเป็นรูปภาพหรือคำอธิบาย

    // สุ่มเลือกว่าแต่ละการ์ดควรเป็นรูปภาพหรือคำอธิบาย
    for (int i = 0; i < 6; i++) {
      isPic.add(random.nextBool());
    }

    // สร้างลิสต์การ์ดใหม่โดยเลือกตามค่าที่สุ่มได้
    for (int i = 0; i < 6; i++) {
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
      isFlipped = List.filled(12, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Easy Mode',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontFamily: 'TonphaiThin',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
              children: [
                Text(
                  'Time: $timeLeft',
                  style: TextStyle(
                    fontSize: 30,
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
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: 12,
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