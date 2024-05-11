



import 'dart:convert';

import 'package:cars_app/features/home/models/brandModel.dart';
import 'package:http/http.dart'as http;
class GetAllBrand{
  static Future<List<BrandModel>> getallBRands() async {
    http.Response response = await http.get(
        Uri.parse('here put link to get models by brand'),
        headers: {

        }
    );
    print('after');
    print(response.statusCode);
    Map<String, dynamic> allGlasses = jsonDecode(response.body);

    List<BrandModel> brands = [];
    for (int i = 0; i < allGlasses['brands'].length; i++) {
      brands.add(BrandModel.fromjson(allGlasses['brands'][i]));

    }

    return brands;
  }
}