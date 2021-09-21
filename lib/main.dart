import 'package:flutter/material.dart';
import 'package:peer_to_peer/screen/LoginScreen.dart';







void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromRGBO(70, 100, 75, 1),),
      title: "Peer to Peer finder",
      debugShowCheckedModeBanner: false,
      home: Signin(),

    );
  }
}
