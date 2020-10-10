import 'package:flutter/material.dart';
import 'package:tutorly/screens/payments/payment.dart';
import 'package:tutorly/services/auth.dart';
import 'package:tutorly/screens/home/profile.dart';

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
        centerTitle: true,
          backgroundColor: Colors.blue[400],
          title: Text('Home'),
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
          drawer: new Drawer(
            
            
            child: ListView(
            
            children: <Widget>[

              DrawerHeader(
                decoration:BoxDecoration(
                  gradient:LinearGradient(colors:<Color>[

                    Colors.blue[600],
                    Colors.lightBlueAccent,

                  ] ),),
                child:Text('                Main Menu',style: TextStyle(fontSize: 20),),),

                       


              

              new ListTile(
                leading: new IconButton(icon:Icon (Icons.person,color:Colors.black), 
                color:Colors.black),

                title: Text('My Profile',style: TextStyle(fontSize: 15),),
                onTap: (){

                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(

                  builder: (BuildContext context)=> new ProfilePage())
                  );



                },
              ),

               new Divider(

              color:Colors.black,
              height:5.0,  
              ),

               new ListTile(
                leading: new IconButton(icon:Icon (Icons.payment,color:Colors.black), 
                color:Colors.black),

                title: Text('Add Payment Method',style: TextStyle(fontSize: 15),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(

                  builder: (BuildContext context)=> new Payments()));
                 
                },),

                        
              

            ],),),
    );
  }
}
