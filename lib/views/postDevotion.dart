import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabali/bloc/devotionBloc.dart';
import 'package:kabali/repository/devotionRepo.dart';

class PostDevotion extends StatelessWidget {
  final DevotionRepo  _devotionRepo  = DevotionRepo();
  @override
  Widget build(BuildContext context) {
    // final postDevotionBloc = BlocProvider.of<DevotionBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Post a devotion'),),
      body: BlocProvider<DevotionBloc>(
            create: (context) => DevotionBloc(_devotionRepo ),
              child: HandlePostingDevotion()),
      
    );
  }
}

class HandlePostingDevotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevotionBloc, PostDevotionState>(
      builder: (context, state) {
        if(state is NotPostedYet) {
          return DevotionPostForm();
        } else if( state is PostDevotionState) {
          return Center(child: CircularProgressIndicator(),);
          
        }else if (state is PostedDevotionState) {
          print('Posted a devotion');
          return Center(child: Text('Devotion posted successfully'),);
        } else if  (state is FailedToPostDevotion) {
          return Center(child: Text('Error'),);
        }
      },
      
    );
  }
}


class DevotionPostForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final devotionBloc = BlocProvider.of<DevotionBloc>(context);
    return Padding(
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
               onPressed: () { 
                 devotionBloc.add(PostDevotionEvent(
                   _titleController.text,
                   _bodyController.text
                 ));
               },
               color: Colors.blue,
            )

            
          ],),
        );

  }
}