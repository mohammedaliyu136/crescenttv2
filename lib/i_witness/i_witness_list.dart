import 'package:flutter/material.dart';

import 'iwitness.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IWitnessList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('userspp').orderBy("timeStamp", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Card(
                    elevation: 5,
                    child: new Column(children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(document['url']), fit: BoxFit.cover )),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0, bottom: 20, left: 10, right: 10),
                        child: Text(document['description']),
                      ),
                      SizedBox(height: 20,)
                    ],),
                  ),
                );

              }).toList(),
            );
        }
      },
    ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageCapture777()),
          ).then((_) {
            // Call setState() here or handle this appropriately
            print("i am back");
          });
        },),
    );
  }
}
