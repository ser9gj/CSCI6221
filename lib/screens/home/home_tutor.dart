import 'package:flutter/material.dart';
import 'package:tutorly/services/auth.dart';

class Home_Tutor extends StatefulWidget {
  

  @override
  _Home_TutorState createState() => _Home_TutorState();
}

class _Home_TutorState extends State<Home_Tutor> {
  
    final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text('                            Home'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Sign out'),
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ]),
    );
  }
}
