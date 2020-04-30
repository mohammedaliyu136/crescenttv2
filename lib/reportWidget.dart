import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  var author;
  var title;
  var url;

  ReportWidget(this.author, this.title, this.url);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 3,
        child: Column(children: <Widget>[
          SizedBox(height: 16,),
          Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Icon(Icons.person_pin, size: 40,),
              SizedBox(width: 5,),
              Text("author", style: TextStyle(fontSize: 16),),
            ],
          ),
          SizedBox(height: 10,),
          Container(height: 200,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("jskjd djdj djd dkld dkdlk dkdkdl kdkl d jskjd djdj djd dkld dkdlk dkdkdl kdkl d jskjd djdj djd dkld dkdlk dkdkdl kdkl d jskjd djdj djd dkld dkdlk dkdkdl kdkl d", maxLines: 7,),
          )
        ],),
      ),
    );
  }
}
