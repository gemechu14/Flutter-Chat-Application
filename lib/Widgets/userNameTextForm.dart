import 'package:flutter/material.dart';

class UserNameTextForm extends StatefulWidget {
  _UserNameTextForm createState() => _UserNameTextForm();
}

class _UserNameTextForm extends State<UserNameTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 10.0, color: Colors.red),
        hintText: 'Username',
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
