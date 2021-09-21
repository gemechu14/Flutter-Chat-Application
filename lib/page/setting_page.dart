import 'package:flutter/material.dart';
import 'package:peer_to_peer/Widgets/navigationDrawer.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Settings'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(70, 100, 75, 1),
    ),
  );
}