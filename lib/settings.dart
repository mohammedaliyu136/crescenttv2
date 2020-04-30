import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: ListView(

        children: ListTile.divideTiles(
    context: context,
    tiles: [
        ListTile(title: Text("Notifications",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("About Us",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("More Sections",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Rate this App",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Background Refresh",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),), trailing: CupertinoSwitch(value: true,),),
        ListTile(title: Text("Night Mode",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),), trailing: CupertinoSwitch(value: false,),),
        ListTile(title: Text("Share this App",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Privacy policy",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Terms and Conditions",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Support",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
        ListTile(title: Text("Version 0.0.1-beta",style: TextStyle( fontSize: 18, fontFamily: 'HelveticaNeue'),),),
      ] ).toList(),)
    );
  }
}
