import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Request extends StatefulWidget {
  Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  File? _image1;
  File? _image2;
  String? _imageName1;
  String? _imageName2;
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();

  Future<void> _getImageFromGallery(int imageNumber, String? imageName) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
          _imageName1 = imageName ?? pickedFile.path.split('/').last;
        } else if (imageNumber == 2) {
          _image2 = File(pickedFile.path);
          _imageName2 = imageName ?? pickedFile.path.split('/').last;
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
      final String destinationPath1 =
          'your_destination_directory/${_imageName1}';
      _image1!.copy(destinationPath1);

      // Copy image 2
      final String destinationPath2 =
          'C:\Users\d9_ca\Desktop\match_word-master\match_word-master\assets/${_imageName2}';
      _image2!.copy(destinationPath2);

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
      title: "Setting",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bluegradient.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Take Picture",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontFamily: 'TonphaiThin',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _image1 != null
                                ? Image.file(
                                    _image1!,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    height: 200,
                                    color: Colors.grey,
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            TextFormField(
                              controller: _textFieldController1,
                              decoration: InputDecoration(
                                hintText: 'Enter Image Name 1',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _getImageFromGallery(
                                    1, _textFieldController1.text);
                              },
                              child: Text(
                                "Select Image 1",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Take Picture",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontFamily: 'TonphaiThin',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _image2 != null
                                ? Image.file(
                                    _image2!,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    height: 200,
                                    color: Colors.grey,
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            TextFormField(
                              controller: _textFieldController2,
                              decoration: InputDecoration(
                                hintText: 'Enter Image Name 2',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _getImageFromGallery(
                                    2, _textFieldController2.text);
                              },
                              child: Text(
                                "Select Image 2",
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
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _saveImages();
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
            ],
          ),
        ),
      ),
    );
  }
}
