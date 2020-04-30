import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categoryWidget.dart';
import 'videosWidget.dart';

Widget watchWidget(){
  return Column(
    children: <Widget>[
        Container(
        alignment: Alignment.center,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: Icon(Icons.play_circle_outline, size: 50, color: Colors.white,)),
            ),
          ),
          height: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/livestream.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      //
      //Container(height: 300, color: Colors.deepOrange,),
      Expanded(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            videosWidget(),
        ],),
      )
    ],
  );
}