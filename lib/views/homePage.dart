import 'package:flutter/material.dart';

import 'package:kabali/views/postDevotion.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Sight'),        
      ),
      drawer: Drawer( 
        child: ListView( 
          padding: EdgeInsets.zero,
          children: <Widget>[ 
            DrawerHeader( 
              child: Text('Quiet time'),
              decoration: BoxDecoration( 
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Post a devotion'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostDevotion()));
                // Navigator.pop(context);
              },
            ),
             ListTile(
              title: Text('Post a scripture'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

          ],),
      ),
      // backgroundColor: Colors.teal,
      body: Center( 
        child: Text('Side Menu tut'),
      ),
    );
  }
}

// class Post extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: <Widget>[
//         Container( 
//           padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Text('Welcome to Quiet time'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                 Column(children: <Widget>[
//                   RaisedButton( 
                    
//                     child: Text('Post a devotion', 
//                     style: TextStyle(color: Colors.white),),
//                     onPressed: (){},
//                     color: Colors.blueAccent,
//                   )
//                 ],),
//                 Column(children: <Widget>[
//                   FlatButton( 
//                     child: Text('Share a verse',
//                     style: TextStyle(color:Colors.white),),
//                     onPressed: (){ 
//                       Navigator.push(context, 
//                        MaterialPageRoute(builder: (context) => PostDevotion()),
//                       );
//                     },
//                     color: Colors.blueAccent,
                    
//                   )
//                 ],)
//               ],)
//             ],
//           ),),
//       ],),      
//     );
//   }
// }