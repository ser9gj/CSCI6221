import 'package:flutter/material.dart';
import 'package:tutorly/shared_code/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fname = '';
  String lname = '';
  String lstudy = '';
  String clss = '';

  String major = '';

  final firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: new AppBar(
          centerTitle: true,
          title: Text('My Profile'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 0.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                     First Name'),
                  onChanged: (value) {
                    fname = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                     Last Name'),
                  onChanged: (value) {
                    lname = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                   Level of Study'),
                  onChanged: (value) {
                    lstudy = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                    Classification'),
                  onChanged: (value) {
                    clss = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                          Major'),
                  onChanged: (value) {
                    major = value;
                  },
                ),
                SizedBox(height: 40.0),
                RaisedButton( color:Colors.yellow[300],
                    child: Text('Done', style: TextStyle(color: Colors.black)),
                    onPressed: () async {
                      firestore.collection('users').add({
                        
                        'first name':fname,
                        'last name':lname,
                        'level of study':lstudy,
                        'classification':clss,
                        'major': major,
                      });
                    }),
              ],
            ))));
  }
}
