import 'dart:convert';
import 'package:cars_app/features/home/models/modelModel.dart';
import 'package:http/http.dart' as http;

class GetModelsByBRand {
  static Future<List<ModelModell>> getmodelsByBRand(int brand) async {
    http.Response response = await http.get(
      Uri.parse('http://carsapi.runasp.net/api/Brand/$brand'),
    );

    print(response.statusCode);
    Map<String, dynamic> allModels = jsonDecode(response.body);

    List<ModelModell> models = [];
    for (int i = 0; i < allModels['models'].length; i++) {
      models.add(ModelModell.fromjson(allModels['models'][i]));
    }

    print(models.length);

    return models;
  }
}
