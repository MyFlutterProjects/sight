import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kabali/models/devotionModel.dart';

class DevotionRepo { 

  Future<Devotion> fetchDevotions() async { 
    final result = await http.Client().get(
       'https://quiet-time-backend.herokuapp.com/api/devotion',
    );

    print(result.body);
    if (result.statusCode != 200 )
        throw Exception();
    print(result.body);
    var response = json.decode(result.body);
    print(response);

    return Devotion.fromJson(response);

  }
}