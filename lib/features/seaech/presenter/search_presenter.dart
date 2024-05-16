import 'dart:convert';

import 'package:cars_app/features/cars_by_category_or_model/model/CarModel.dart';
import 'package:http/http.dart' as http;
class Search {

  static Future<List<Car>> getAllCars (String search) async{

    final url = 'http://carsapi.runasp.net/api/Car/search?name=$search';
    // final queryParams = {
    //   'CategoryIds': categoryIds.join(','),
    // };

    final response = await http.get(
      Uri.parse(url
        // +
        // '?' +
        // Uri(queryParameters: queryParams).query
      ),

    );

    if (response.statusCode == 200){
      // Handle successful response
    } else {
      // Handle error response

    }


    print(response.statusCode);
  List<dynamic> allCars= jsonDecode(response.body);
    // print('test ${allGlasses["pageNumber"]}');
    List<Car> searchResult = [];

    for(int i=0 ; i < allCars.length ; i++){
      searchResult.add(Car.fromJson(allCars[i]));

    }

    return searchResult;
  }

}