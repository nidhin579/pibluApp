import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pibluapp/text.dart';
import 'package:pibluapp/variables.dart';

class EditPage extends StatefulWidget {
  @override
  static const String id = 'EditPage';
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  @override
  void _sendDataBack(BuildContext context) {
    String textToSendBack = 'refresh';
    Navigator.pop(context, textToSendBack);
  }

  File _image;
  String path;
  Future<void> imagepick() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        imported = _image;
      });
    });
    path = _image.path;
    setState(() {
      propic = path;
      pic = true;
    });
  }

  void dispose() {
    myController4.dispose();
    myController3.dispose();
    myController2.dispose();
    myController5.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double opacity = 0;
    setState(() {
      opacity = .6;
    });
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    imagepick();
                  },
                  child: Hero(
                      tag: 'pro',
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                pic ? FileImage(imported) : AssetImage(propic),
                          ),
                          AnimatedOpacity(
                            duration: Duration(seconds: 2),
                            opacity: opacity,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Center(
                              child: Text(
                            'Tap to change',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ))
                        ],
                      )),
                )),
            SizedBox(
              height: 30,
            ),
            typeB('NAME'),
            Container(
              width: 300,
              child: TextField(
                controller: myController5,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  hintText: '$name',
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            typeB('NUMBER OF POSTS'),
            Container(
              width: 300,
              child: TextField(
                controller: myController2,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  hintText: '$numbp',
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            typeB('NUMBER OF FOLLOWERS'),
            Container(
              width: 300,
              child: TextField(
                controller: myController3,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  hintText: '$follo',
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            typeB('NUMBER OF FOLLOWING'),
            Container(
              width: 300,
              child: TextField(
                controller: myController4,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  hintText: '$follin',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              child: Text(
                'Save Changes',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  myController5.text != ''
                      ? name = myController5.text
                      : print('Controller5');
                  myController2.text != ''
                      ? numbp = int.parse(myController2.text)
                      : print('controller 2');
                  myController3.text != ''
                      ? follo = int.parse(myController3.text)
                      : print('controller3');
                  myController4.text != ''
                      ? follin = int.parse(myController4.text)
                      : print(myController4.text);
                });
              },
              color: Color.fromRGBO(79, 32, 149, 100),
            ),
            FlatButton(
              child: Text(
                'BACK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context, () {
                  _sendDataBack(context);
                });
              },
              color: Color.fromRGBO(79, 32, 149, 100),
            )
          ],
        ),
      ),
    ));
  }
}
