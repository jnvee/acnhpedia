import 'package:acnhpedia/api_key.dart';
import 'package:acnhpedia/networking/api_base_helper.dart';
import 'package:acnhpedia/models/villager_model.dart';

class VillagerDetailRepository {
  final String _apiKey = api_key;

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<villager> fetchVillagerData(String villager_name) async {
    final response = await _helper.get("villagers?x-api-key=$_apiKey");
    return villager.fromJson(response);
  }
}
