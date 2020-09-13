import 'package:flutter/material.dart';
import 'package:tutorly/services/auth.dart';
import 'package:tutorly/shared_code/constant.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  String error='';

  //text field state
  String email ="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor:Colors.blue[400],
      elevation: 0.0,
      title:Text('Sign in '),
      actions: <Widget>[
        FlatButton.icon(
          icon:Icon(Icons.person),         
          label: Text('Register'),
          onPressed: (){
            widget.toggleView();
          }),
      ],
      ),

      body:Container(
        
        padding:EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key:_formKey,

          child:Column(
            children: <Widget>[
              Text('User',style:TextStyle(
                color:Colors.white,
                fontSize: 17.0,
                )
              
                ,),
              SizedBox(height:20.0),
              TextFormField(
               decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (val)=>val.isEmpty ? 'Enter an email':null,

                onChanged:(val){
                  setState(() 
                    => email=val);

                }
                
              ),

              Text('Password',style: TextStyle(
                color:Colors.white,
                fontSize: 17.0,
                ),),

              SizedBox(height:20.0),
              TextFormField(
               decoration: textInputDecoration.copyWith(hintText:'Password'),

                obscureText: true,
                validator: (val)=>val.length< 6 ? 'Enter a password longer than 6 characters':null,

                onChanged:(val){
                  setState(() 
                    => password=val);
                  
                }

              ),

              SizedBox(height:20.0),
              RaisedButton(
                color:Colors.blue[600],
                child: Text('Sign in',
                style:TextStyle(color: Colors.white)
                ),
                onPressed: ()async {

                   if(_formKey.currentState.validate()){
                     
                     dynamic result= await _auth.signInWithEmailAndPassword(email, password);

                    if(result==null)
                    {
                      setState(() =>error='could not sign in with those inputs');                  
                      
                    }
                  }
                }),
                SizedBox(height:8.0),
                Text(
                  error,
                  style: TextStyle(color:Colors.red, fontSize:14.0),
                ),

          ],)
        )   
      
      ),);
  }
}