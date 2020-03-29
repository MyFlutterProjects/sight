import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kabali/models/devotionModel.dart';
import 'package:kabali/repository/authRepo.dart';

class DevotionRepo { 
   final _url = 'https://quiet-time-backend.herokuapp.com/api/devotion';
  //  AuthRepo authrepo;  
  //  final token = AuthRepo.read();
  Future<Devotion> fetchDevotions() async { 
    
    final result = await http.Client().get(this._url);

    print(result.body);
    if (result.statusCode != 200 )
        throw Exception('Failed to fetch devotions');
    print(result.body);
    var response = json.decode(result.body); 

    return Devotion.fromJson(response);

  }

  Future<String> postDevotion(String title, String body) async { 
    final token = await AuthRepo.read();       
    final response = await http.Client().post(
      this._url, 
      headers: <String, String> { 
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token
      },
      body: jsonEncode(<String, String> { 
        'title': title,
        'body': body
      }),
    );
    if (response.statusCode != 200)
      throw Exception('Failed to post devotion');
    
    var  message = json.decode(response.body);
    print(message['message']);

    return message['message'];

  }



}