import 'package:flutter/material.dart';

class EmailTextForm extends StatefulWidget {
 
  _EmailTextForm createState() => _EmailTextForm();
}

class _EmailTextForm extends State<EmailTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width * 0.925,
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 10.0, color: Colors.red),
          hintText: 'email',
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
      ),
    );
  }
}
