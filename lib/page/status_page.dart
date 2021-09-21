import 'package:flutter/material.dart';
import 'package:peer_to_peer/Widgets/navigationDrawer.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Status'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(70, 100, 75, 1),
    ),
  );
}