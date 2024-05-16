

import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../models_inside_brand/model/modelClass.dart';


class GetAllBrandAndCategoreis{
  static Future<List<BrandModel>> getallBRands() async {
    http.Response response = await http.get(
        Uri.parse('http://carsapi.runasp.net/api/Brand'),

    );
    print('after');
    print(response.statusCode);
   List<dynamic> allBrands = jsonDecode(response.body);

    List<BrandModel> brands = [];
    for (int i = 0; i < allBrands.length; i++) {
      brands.add(BrandModel.fromjson(allBrands[i]));

    }

    return brands;
  }
  static Future<List<BrandModel>> getallCategoteis() async {
    http.Response response = await http.get(
      Uri.parse('http://carsapi.runasp.net/api/Category'),

    );
    print('after');
    print(response.statusCode);
    List<dynamic> allCategoies = jsonDecode(response.body);

    List<BrandModel> brands = [];
    for (int i = 0; i < allCategoies.length; i++) {
      brands.add(BrandModel.fromjson(allCategoies[i]));

    }

    return brands;
  }

}