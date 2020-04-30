import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/api_provider.dart';
import 'detail_page.dart';
import 'model/ResponseArticles.dart';

Future<ResponseArticles> headlinesNews = ApiProvider().getTopHeadlinesNews();
Widget topStoriesWidget(){
  return Container(
    child: FutureBuilder<ResponseArticles>(
      future: headlinesNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.totalResults,
              itemBuilder: (BuildContext context, index) {
                if (index == 0) {

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
                                style: TextStyle(
                                                 fontSize: 25,
                                                 fontFamily: 'HelveticaNeueBold'
                                ),maxLines:3, overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 8.0,),
                              Text("This is coming six days after the governor tested positive for the COVID-19 and This is coming six days after the governor ",
                                style: TextStyle(fontSize: 18,
                                                 color: Colors.grey,
                                                 fontFamily: 'HelveticaNeue'
                                ),
                                maxLines:3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,)
                      ],),
                    ),
                  );
                }else if (index == 2) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(height: 100, color: Colors.grey[350], child: Center(child: Text("Advertisement!!!", style: TextStyle(fontSize: 20),)),),
                  );
                }else if (index%5 == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(height: 100, color: Colors.grey[350], child: Center(child: Text("Advertisement!!!", style: TextStyle(fontSize: 20),)),),
                  );
                } else {
                  return GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage(snapshot.data.articles[index])),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child: Container(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Headline, Health",
                                style: TextStyle( fontSize: 14, color: Colors.deepOrange),
                                maxLines:3, overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 5.0,),
                              Text(snapshot.data.articles[index].title,
                                style: TextStyle( fontSize: 20, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.w500),
                                maxLines:4, overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20,),
                              SizedBox(height: 2, child: Container(color: Colors.grey[300],),),
                            ],
                          ))),
                          SizedBox(width: 5,),
                          Container(
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("http://www.channelstv.com/wp-content/uploads/2020/04/eu-Nigeria.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
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
        return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(128, 0, 128, 1)),));
      },
    ),
  );
}