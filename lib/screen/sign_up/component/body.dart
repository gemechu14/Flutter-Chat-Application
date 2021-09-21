import 'package:flutter/material.dart';
import 'package:peer_to_peer/constant.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var headingStyle2 = headingStyle;
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04), // 4%
                Text("Register Account", style: TextStyle(fontSize: 25,color: Colors.lightBlueAccent,)
                ),

                SizedBox(height: height * 0.08),
                SignUpForm(),
                SizedBox(height: height * 0.08),
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
