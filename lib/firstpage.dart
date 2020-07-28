import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pibluapp/edit_page.dart';
import 'package:pibluapp/text.dart';

import 'variables.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void _awaitReturnValueFromSecondScreen(BuildContext context) async {
      // start the SecondScreen and wait for it to finish with a result
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPage(),
          ));

      // after the SecondScreen result comes back update the Text widget with it
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 20),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: Color.fromRGBO(213, 227, 255, 100)),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          _awaitReturnValueFromSecondScreen(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(228, 226, 244, 100),
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/settings.png',
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                    fontFamily: 'Acme',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(79, 32, 149, 100)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      child: Hero(
                          tag: 'pro',
                          child: CircleAvatar(
                            radius: 135,
                            backgroundImage:
                                pic ? FileImage(imported) : AssetImage(propic),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Acme'),
                    ),
                  ],
                ),
              ),
            ),
            flex: 5,
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(40),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        type('Number of posts', numbp),
                        Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        type('Number of followers', follo),
                        Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        type('Number of following', follin),
                      ],
                    )),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
            ),
          )
        ],
      )),
    );
  }
}
