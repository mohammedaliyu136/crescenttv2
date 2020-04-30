
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'reportWidget.dart';

Widget ureport(){
  return Scaffold(
    body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Eye Witness Reports", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
        ),
        ReportWidget("author02", "kdnd   djdjd ld d d dklkd dld d dld dll d", "assets/images/science.jpg"),
        ReportWidget("author02", "kdnd   djdjd ld d d dklkd dld d dld dll d", "assets/images/livestream.jpg"),
        ReportWidget("author02", "kdnd   djdjd ld d d dklkd dld d dld dll d", "assets/images/politics.jpg"),
        ReportWidget("author02", "kdnd   djdjd ld d d dklkd dld d dld dll d", "assets/images/technology.jpg"),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        //_incrementCounter;
      },
      tooltip: 'Increment',
      child: Icon(Icons.camera_alt),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}