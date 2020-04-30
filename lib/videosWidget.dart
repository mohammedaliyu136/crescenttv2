import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'singleVideo.dart';

Widget videosWidget(){
  return Column(
    children: <Widget>[
      SingleVideo(true, ["Video 1", "Video 2"], ["assets/images/politics.jpg","assets/images/science.jpg"]),
      SingleVideo(true, ["Video 3", "Video 4"], ["assets/images/food.jpg", "assets/images/sport.jpg"]),
      SingleVideo(true, ["Video 5", "Video 6"], ["assets/images/technology.jpg", "assets/images/travel.jpg"]),
      SingleVideo(true, ["Video 5", "Video 6"], ["assets/images/technology.jpg", "assets/images/travel.jpg"]),
      SingleVideo(true, ["Video 5", "Video 6"], ["assets/images/technology.jpg", "assets/images/travel.jpg"]),
      SingleVideo(true, ["Video 5", "Video 6"], ["assets/images/technology.jpg", "assets/images/travel.jpg"]),
    ],
  );
}