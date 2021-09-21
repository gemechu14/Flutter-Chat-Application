import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peer_to_peer/Widgets/emailTextForm.dart';
import 'package:peer_to_peer/Widgets/forgetButton.dart';
import 'package:peer_to_peer/Widgets/passwordTextFormField.dart';
import 'package:peer_to_peer/Widgets/remember_me.dart';
import 'package:peer_to_peer/Widgets/wideButton.dart';
import 'package:peer_to_peer/screen/sign_up/sign_up_screen.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController _emailTextEditing = TextEditingController();
  // TextEditingController _passwordTextEditing = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      colors: [Colors.white12, Colors.white12],
                      tileMode: TileMode.clamp)),
              child: ListView(children: [
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Image.asset("images/login.png"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0),
                            child: EmailTextForm()),
                        Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: PasswordTextForm("Password")),
                        RememberMe(),
                        WideButton("Login"),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: ForgetButton(),
                        ),
                        SizedBox(height: 10.0,),
                        signUpBtn(),
                      ],
                    )),
              ])),
        ),
      ),
    );
  }

 


  
  

  

  signUpBtn() {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w200)),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  
                 
                  Route route = MaterialPageRoute(builder: (_) =>SignUpScreen());
                     Navigator.pushReplacement(context, route);
                 
                },
              text: "Create account",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ])),
      ),
    );
  }
}
