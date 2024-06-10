import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:match_word/login/Home_Play.dart';

class Request extends StatefulWidget {
  Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  File? _image1;
  File? _image2;
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();

  Future<void> _getImageFromGallery(int imageNumber, String? imageName) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
        } else if (imageNumber == 2) {
          _image2 = File(pickedFile.path);
        }
      });
    }
  }

  void _saveImages() {
    if (_image1 != null && _image2 != null) {
      // Implement your saving logic here
      // For example, you can copy the images to a specific directory
      // and rename them with the provided image names.

      // Copy image 1

      // Copy image 2

      // Display a message to indicate successful saving
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Images saved successfully.'),
        ),
      );
    } else {
      // Display a message if any image is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select both images.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: IconButton(
          icon: Image.asset(
            'assets/images/arrowBack.png',
            width: 50,
            height: 50,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlayPage()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgLevel.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Word",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontFamily: 'PandaThin',
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                          color: Color.fromARGB(
                                              255, 231, 116, 150),
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                                _image1 != null
                                    ? Image.file(
                                  _image1!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                )
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    height: 200,
                                    color: Colors.purple.shade100,
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    _getImageFromGallery(
                                        1, _textFieldController1.text);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(
                                        0xFF8ED2B2)),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                                    ),
                                  ),
                                  child: Text(
                                    "Select Image",
                                    style: TextStyle(
                                      fontSize: 15,
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
                        SizedBox(width: 16),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Picture",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontFamily: 'PandaThin',
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                          color: Color.fromARGB(255, 231, 116, 150),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                _image2 != null
                                    ? Image.file(
                                  _image2!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                )
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    height: 200,
                                    color: Colors.purple.shade100,
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    _getImageFromGallery(2, _textFieldController2.text);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(0xFF8ED2B2)),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                                    ),
                                  ),
                                  child: Text(
                                    "Select Image",
                                    style: TextStyle(
                                      fontSize: 15,
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
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _textFieldController1,
                        decoration: InputDecoration(
                          labelText: 'Name Picture',
                          hintText: 'Enter Name Picture',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                            fontFamily: 'TonphaiThin',
                            color: Colors.blueGrey,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'TonphaiThin',
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _textFieldController2,
                        decoration: InputDecoration(
                          labelText: 'Meaning',
                          hintText: 'Enter Meaning',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                            fontFamily: 'TonphaiThin',
                            color: Colors.blueGrey,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'TonphaiThin',
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        _saveImages();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0x7F7DD3AC)),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.black,
                          fontFamily: 'TonphaiThin',
                          fontWeight: FontWeight.w900,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Color.fromARGB(255, 173, 133, 172),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}