import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SingleCategory2.dart';

Widget categoryWidget(){
  return
    ListView(
      shrinkWrap: true,
      children: <Widget>[
        SingleCategory(true, ["Politics", "Science"], ["assets/images/politics.jpg","assets/images/science.jpg"]),
        SingleCategory(true, ["Food", "Sport"], ["assets/images/food.jpg", "assets/images/sport.jpg"]),
        SingleCategory(true, ["Technology", "Travel"], ["assets/images/technology.jpg", "assets/images/travel.jpg"]),
      ],
    );
}