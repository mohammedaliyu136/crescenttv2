import 'package:flutter/material.dart';
import 'package:crescenttv/tabs_widgets.dart';

import 'api/api_provider.dart';
import 'camera2.dart';
import 'categoryWidget.dart';
import 'i_witness/i_witness_list.dart';
import 'model/ResponseArticles.dart';
import 'settings.dart';
import 'topStoriesWidgets.dart';
import 'ureportWidget.dart';
import 'video/screens/home_screen.dart';
import 'watchWidget.dart';

class Headline2 extends StatefulWidget {

  Headline2({Key key}) : super(key: key);

  @override
  _Headline2State createState() => _Headline2State();
}

class _Headline2State extends State<Headline2> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 5, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Container(
        child: topStoriesWidget()),
        VideoListScreen(),
        //watchWidget(),
        categoryWidget(),
        //ureportWidgets(),
        IWitnessList()
        //ureport(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: Text("LATEST NEWS"),
          elevation: _selectedIndex !=1? 5:0,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Icon(
                    Icons.more_vert,
                    size: 26.0,
                  ),
                )
            ),]
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode, size: 25,),
            title: Text('Top Stories',style: TextStyle(
                fontSize: 14)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library, size: 25,),
            title: Text('Watch', style: TextStyle(
                fontSize: 14)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 25,),
            title: Text('Browse', style: TextStyle(
                fontSize: 14)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, size: 25,),
            title: Text('UReport', style: TextStyle(
                fontSize: 14)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}