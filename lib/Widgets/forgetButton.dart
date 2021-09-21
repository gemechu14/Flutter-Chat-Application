import 'package:flutter/material.dart';
class ForgetButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
        onPressed: () {},
        child: Text(
          "Forget Password",
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}