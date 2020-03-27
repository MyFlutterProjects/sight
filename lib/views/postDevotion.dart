import 'package:flutter/material.dart';

class PostDevotion extends StatelessWidget {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post a devotion'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text('Create devotion', style: TextStyle(),),
          Padding( 
            padding: const EdgeInsets.all(8.0),
            child: TextField( 
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Enter devotion title'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField( 
              controller: _bodyController,
              decoration: InputDecoration(hintText: 'Enter devotion'),
            ),
          ),

          RaisedButton( 
            child: Text('Create devotion', style: TextStyle(color:Colors.white),),
             onPressed: () {},
             color: Colors.blue,
          )

          
        ],),
      ),
      
    );
  }
}