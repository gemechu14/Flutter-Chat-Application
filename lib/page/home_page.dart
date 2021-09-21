import 'package:flutter/material.dart';
import 'package:peer_to_peer/MainPage/home.dart';
//import 'package:peer_to_peer/Widgets/navigationDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Route route = MaterialPageRoute(builder: (_) => NavigationDrawerWidget());
          // Navigator.pushReplacement(context, route);
        },
      ),
      title: Text('News Feed'),
      
    ),
    body: Home(),
  );
  
}