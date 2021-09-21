import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:peer_to_peer/Widgets/navigationDrawer.dart';
//import '../Widgets/navigationDrawer.dart';

AppBar buildAppBar(BuildContext context) {
  //Navigator.of(context).pop();
  final icon = CupertinoIcons.moon_stars;
  {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
          //  Route route = MaterialPageRoute(builder: (_) => NavigationDrawerWidget());
          //  Navigator.pushReplacement(context, route);
        },
      ),
      title: Text('Profile'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(70, 100, 75, 1),
      actions: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
    );
  }
}
