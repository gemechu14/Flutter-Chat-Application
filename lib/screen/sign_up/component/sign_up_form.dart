import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peer_to_peer/Widgets/emailTextForm.dart';
import 'package:peer_to_peer/Widgets/passwordTextFormField.dart';
import 'package:peer_to_peer/Widgets/wideButton.dart';
import 'package:peer_to_peer/screen/sigin/signin_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextForm(),
          PasswordTextForm("Password"),
          PasswordTextForm("Confirm Password"),
          WideButton("Create Account"),
          SizedBox(height: 10),
          loginBtn(),
        ],
      ),
    );
  }

  loginBtn() {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Already have an account ?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w200)),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Route route = MaterialPageRoute(builder: (_) => Login());
                  Navigator.pushReplacement(context, route);
                },
              text: "Sign",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ])),
      ),
    );
  }
}
