import 'package:flutter/material.dart';

class SingleVideo extends StatelessWidget {
  var double;
  var title;
  var url;

  SingleVideo(this.double, this.title, this.url);
  @override
  Widget build(BuildContext context) {
    if(double){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title[0]+"000000 000000 00 0000000000 000000 000000 00 0000000000",maxLines: 2, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),),
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(url[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title[1]+"000000 000000 00 0000000000 000000 000000 00 0000000000",maxLines: 2, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),),
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(url[1]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
