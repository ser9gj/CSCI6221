import 'package:flutter/material.dart';

class CSience extends StatefulWidget {
  @override
  _CSienceState createState() => _CSienceState();
}

class _CSienceState extends State<CSience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        centerTitle: true,
          backgroundColor: Colors.blue[400],
          title: Text('Computer Science',
          style: TextStyle(color: Colors.yellow[300]),),
      ),
      
    );
  }
}