import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabali/models/authModel.dart';
import 'package:kabali/repository/authRepo.dart';

class AuthEvent extends Equatable {
  @override 
  List<Object> get props => [];
}

class Authenticate extends AuthEvent { 
  final _username;
  final _password;

  Authenticate(this._username, this._password);
  
  
  @override 
  List<Object> get props => [_username, _password];

}

class Logout extends AuthEvent {}

class AuthState extends Equatable {
  @override 
  List<Object> get props => [];

}

class AuthNotAttempted extends AuthState{}

class AuthIsLoading extends AuthState{}

class AuthIsLoaded extends AuthState{ 
  final _auth;
  AuthIsLoaded(this._auth);
  @override 
  List<Object> get props => [_auth];

}

class AuthIsNotLoaded extends AuthState{}


class AuthBloc extends Bloc<AuthEvent, AuthState> {
   AuthRepo authRepo; 

   AuthBloc(this.authRepo);

   @override 
   AuthState get initialState => AuthNotAttempted();

   @override 
   Stream<AuthState> mapEventToState(AuthEvent event) async* {
     if (event is Authenticate) {
       yield AuthIsLoading();

       try {
         Auth authResponse= await authRepo.authenticate(event._username, event._password);
         yield AuthIsLoaded(authResponse);

       } catch(e) {
         print(e);
         yield AuthIsNotLoaded();
       }
     } else if (event is Logout) {
       yield AuthNotAttempted();
     }
   }

  
}