import 'package:flutter/material.dart';

import 'package:peer_to_peer/Widgets/wideButton.dart';

class PeerFinder extends StatefulWidget {
  PeerFinder(String s);

  _PeerFinder createState() => _PeerFinder();
}

class _PeerFinder extends State<PeerFinder> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        
      child: ListView(children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15),
              child:
              textForm("First Priority")
              ),
              
 Padding(padding: EdgeInsets.all(15),
              child:
            textForm("Second Priority"),
              ),
              Padding(padding: EdgeInsets.all(15),
              child:
             textForm("Third Priority"),
              ),
             
              WideButton("Apply"),
            ],
          ),
        ),
      ]),
    );
  }

  textForm(String hint) {
    return TextFormField(
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 10.0, color: Colors.red),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
