import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  _RememberMe createState() => _RememberMe();
}

class _RememberMe extends State<RememberMe> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.black),
              child: Checkbox(
                  value: isRememberMe,
                  checkColor: Colors.green,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = value!;
                    });
                  })),
          Text(
            "Remember me",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
