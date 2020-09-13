import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorly/screens/authent/authenticate.dart';
import 'package:tutorly/screens/home/home_tutor.dart';
import 'package:tutorly/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


     final user=Provider.of<User>(context); 
   
    //return either home or authenticate
     if(user==null){
       return Auth_Tutor();
     }

     else{
       return Home_Tutor();
     }
  }}