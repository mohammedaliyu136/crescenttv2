import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  var double;
  var title;
  var url;

  SingleCategory(this.double, this.title, this.url);
  @override
  Widget build(BuildContext context) {
    if(double){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Container(height: 200,
                child: Container(
                  color: Colors.white38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title[0], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                  ),
                ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(url[0]),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(width: 10,),
            Expanded(child: Container(height: 200,
              child: Container(
                  color: Colors.white38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title[1], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                  )),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(url[1]),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Container(height: 200,
              child: Text(title[0]),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(url[0]),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(width: 10,),
            Expanded(child: Container(color: Colors.white, height: 100,
                child: Text('')
            ))
          ],
        ),
      );
    }
  }
}
