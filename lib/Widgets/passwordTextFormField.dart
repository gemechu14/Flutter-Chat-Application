import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextForm extends StatefulWidget {
  final String name;
  PasswordTextForm(this.name);
  _PasswordTextForm createState() => _PasswordTextForm();
}

class _PasswordTextForm extends State<PasswordTextForm> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width * 0.925,
        child: TextFormField(
          style: TextStyle(     
            color: Colors.grey,
            fontSize: 15,
          ).copyWith(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 10.0, color: Colors.red),
            hintText: widget.name,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white70,
                width: 1,
              ),
            ),
          ),
        ));
  }
}
