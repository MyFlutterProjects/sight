
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:kabali/models/authModel.dart';

class AuthRepo {
  Future<Auth> authenticate(String username, String password) async {
    
    final result = await http.Client().post( 
      'https://quiet-time-backend.herokuapp.com/api/auth/signin',
      headers: <String, String> { 
        'Content-Type': 'application/json; charset=UTF-8'
      },
      
      body: jsonEncode(<String, String> { 
        'username': username,
        'password': password
      }),
    );
    
    print(result.body);
    if (result.statusCode != 200) 
        throw Exception();

     return parsedJson(result.body);
  }

  Auth parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return Auth.fromJson(jsonDecoded);
  }
}