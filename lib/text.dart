import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget type(String a, int b) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(250, 250, 255, 20)),
      width: double.infinity,
      height: 50,
      child: Center(
          child: Text(
        '$a :$b',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )));
}

Widget typeB(String a) {
  return Padding(
    padding: EdgeInsets.only(left: 20),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '$a',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
  );
}
