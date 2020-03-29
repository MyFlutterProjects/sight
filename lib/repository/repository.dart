import 'package:kabali/models/devotionModel.dart';
import './devotionRepo.dart';

// mediates between the domain and the data mapping layer
class Repository {
  DevotionRepo devotionRepo =DevotionRepo();

  Future<Devotion> fetchDevotions() => devotionRepo.fetchDevotions();

  // Future<String> postDevotion(String title, String body) async => await devotionRepo.createDevotion(title, body);

  Future<dynamic> postDevotion(String title, String body) async {
    print('herer in repo ab');
    print('$title, $body');

        String response = await devotionRepo.createDevotion(title, body);
        print('Response , $response');
        return response;

  }
}