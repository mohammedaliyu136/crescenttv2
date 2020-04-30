import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/api_provider.dart';
import 'detail_page.dart';
import 'model/ResponseArticles.dart';

class Headline extends StatelessWidget {
  Future<ResponseArticles> headlinesNews = ApiProvider().getTopHeadlinesNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LATEST NEWS"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )
            ),]
    ),
      body: Container(
        child: FutureBuilder<ResponseArticles>(
          future: headlinesNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.totalResults,
                  itemBuilder: (BuildContext context, index) {
                    if (index == 0 || index%3 == 0) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailPage(snapshot.data.articles[index])),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: Column(children: <Widget>[
                            Image.network('https://www.aljazeera.com/mritems/imagecache/mbdxlarge/mritems/Images/2020/4/1/5b20b19e756845cd874502b3d7a41ef3_18.jpg', fit: BoxFit.fitWidth,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 16.0),
                              child: Column(
                                children: <Widget>[
                                  Text(snapshot.data.articles[index].title,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, ),maxLines:3, overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 8.0,),
                                  Text("This is coming six days after the governor tested positive for the COVID-19 and This is coming six days after the governor ",
                                    style: TextStyle(fontSize: 18, color: Colors.grey),maxLines:3, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            )
                          ],),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailPage(snapshot.data.articles[index])),
                          );
                        },
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Headline, Health",
                                      style: TextStyle( fontSize: 14, color: Colors.deepOrange),
                                      maxLines:3, overflow: TextOverflow.ellipsis,),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(snapshot.data.articles[index].title,
                                    style: TextStyle( fontSize: 20),
                                    maxLines:4, overflow: TextOverflow.ellipsis,),

                                ],
                              ),
                              trailing: Image.network("https://www.aljazeera.com/mritems/imagecache/midthumbnail/mritems/Images/2020/3/29/8eb9ea12addd445fac2d7bcbbfcd69c7_18.jpg", fit: BoxFit.scaleDown,),
                            ),
                          ),
                        ),
                      );
                    }
                  }
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(128, 0, 128, 1)),);
          },
        ),
      ),
    );
  }
}
