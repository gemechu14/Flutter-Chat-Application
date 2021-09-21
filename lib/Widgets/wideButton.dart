import 'package:flutter/material.dart';


import 'package:peer_to_peer/screen/sign_up/sign_up_screen.dart';

class WideButton extends StatefulWidget {
  final String name;

  WideButton(this.name);

  @override
  _WideButtonState createState() => _WideButtonState();
}

class _WideButtonState extends State<WideButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.925,
      height: 45,

      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          this.widget.name == "Login" ? moveToCreateAccount() : moveToLogin();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.blue,
        child: Text(
          this.widget.name,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  moveToCreateAccount() {
    Route route = MaterialPageRoute(builder: (_) => SignUpScreen());
    Navigator.pushReplacement(context, route);
  }

  moveToLogin() {
    //  Route route = MaterialPageRoute(builder: (_) => LoginScreen());
    // Navigator.pushReplacement(context, route);
   }
}
