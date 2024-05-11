

import 'dart:convert';

import 'package:cars_app/features/home/models/modelMode.dart';
import 'package:http/http.dart' as http;


class GetModelByBRand {
  static Future<List<ModelModell>> getmodelaByBRand(String brand) async {
    http.Response response = await http.get(
        Uri.parse('here put link to get models by brand'),
        headers: {

        }
    );
    print('after');
    print(response.statusCode);
    Map<String, dynamic> allGlasses = jsonDecode(response.body);

    List<ModelModell> models = [];
    for (int i = 0; i < allGlasses['models'].length; i++) {
      models.add(ModelModell.fromjson(allGlasses['models'][i]));

    }

    return models;
  }
}