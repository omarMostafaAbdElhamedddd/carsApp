

import 'dart:convert';

import 'package:cars_app/features/home/models/modelMode.dart';
import 'package:http/http.dart' as http;


class GetModelByBRand {

  static Future<List<ModelModell>> getmodelaByBRand(int brand) async {
    http.Response response = await http.get(
        Uri.parse('http://carsapi.runasp.net/api/Brand/$brand'),
    );
    print('after');
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