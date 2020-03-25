import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Sight'),),
      // backgroundColor: Colors.teal,
      body: Column(children: <Widget>[
        Container(child: Text('Welcome to Quiet time'),),
      ],),
      
    );
  }
}