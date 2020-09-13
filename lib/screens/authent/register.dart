import 'package:flutter/material.dart';
import 'package:tutorly/services/auth.dart';
import 'package:tutorly/shared_code/constant.dart';

class Register extends StatefulWidget {


  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();

  //text field state
  String email ="";
  String password="";
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor:Colors.blue[400],
      elevation: 0.0,
      title:Text('Sign up'),
      actions: <Widget>[
        FlatButton.icon(
          icon:Icon(Icons.person),         
          label: Text('Sign in'),
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
                child: Text('Register',
                style:TextStyle(color: Colors.white)
                ),
                onPressed: ()async {

                  if(_formKey.currentState.validate()){
                    dynamic result= await _auth.registerWithEmailAndPassword(email,password);

                    if(result==null)
                    {
                      setState(() =>error='please supply a valid email');                  
                      
                    }
                  }

                  
                }),

                SizedBox(height:12.0),
                Text(
                  error,
                  style: TextStyle(color:Colors.red, fontSize:14.0),
                ),

          ],)
        )   
      
      ),);
  }
}