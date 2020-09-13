import 'package:flutter/material.dart';
import 'package:tutorly/screens/authent/register.dart';
import 'package:tutorly/screens/authent/sign_in.dart';


class Auth_Tutor extends StatefulWidget {
  @override
  _Auth_TutorState createState() => _Auth_TutorState();
}

class _Auth_TutorState extends State<Auth_Tutor> {
  @override

  bool showSignIn=true;
  void toggleView(){setState(() => showSignIn=!showSignIn
  );}
  Widget build(BuildContext context) {
    if(showSignIn)
    return SignIn(toggleView: toggleView);

    else
    return Register(toggleView: toggleView);
  }
}