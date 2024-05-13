

 import 'dart:convert';

import 'package:cars_app/features/home/models/moelCar.dart';
 import 'package:http/http.dart'as http;

class GetCarsByBrandOrCatergory{


   static Future<List<Car>> getCarsByModel(int modelId) async {
     http.Response response = await http.get(
         Uri.parse('http://carsapi.runasp.net/api/Model/$modelId'),
         headers: {

         }
     );
     print('after');
     print(response.statusCode);
     Map<String, dynamic> allGlasses = jsonDecode(response.body);

     List<Car> cars = [];
     for (int i = 0; i < allGlasses['cars'].length; i++) {
       cars.add(Car.fromJson(allGlasses['cars'][i]));

     }

     return cars;
   }

   static Future<List<Car>> getCarsByCatergory(String category) async {
     http.Response response = await http.get(
         Uri.parse('here put link that get cars by category'),
         headers: {

         }
     );
     print('after');
     print(response.statusCode);
     Map<String, dynamic> allGlasses = jsonDecode(response.body);

     List<Car> cars = [];
     for (int i = 0; i < allGlasses['cars'].length; i++) {
       cars.add(Car.fromJson(allGlasses['cars'][i]));

     }

     return cars;
   }
 }