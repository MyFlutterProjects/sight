import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabali/bloc/authBloc.dart';

class LoginForm extends StatelessWidget {
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      final authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      padding: EdgeInsets.only(top:180, left:50,right:50),
      child: Column(
        children: <Widget>[
          Text('Sight Sigin', style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person), hintText: 'Username'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock), hintText: 'Password'),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text('Login', style: TextStyle(fontSize: 18),),
              onPressed: () {
                print(_usernameController.text);
                print(_passwordController.text);
                authBloc.add(Authenticate(
                    _usernameController.text, _passwordController.text));
              },
              color: Colors.lightBlue,
            ),
          )
        ],
      ),
    );
  }
}
