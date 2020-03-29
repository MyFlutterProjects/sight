import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabali/bloc/authBloc.dart';
import 'package:kabali/repository/authRepo.dart';
import 'package:kabali/views/homePage.dart';
import 'package:kabali/views/loginForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AuthRepo authRepo = AuthRepo();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // handles overflow issue
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        // backgroundColor: Colors.teal,
        resizeToAvoidBottomInset: false,

        body: BlocProvider(
            create: (context) => AuthBloc(authRepo),
             child: LoginPage()),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthNotAttempted) {
          return LoginForm();
        } else if(state is AuthIsLoading)
          return Center(child: CircularProgressIndicator(),);
          else if (state is AuthIsLoaded){
          return  HomePage();
          }
          return Center(child: Text('Error'),);
      },
    );
  }
}


