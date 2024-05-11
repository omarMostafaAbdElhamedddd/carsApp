
import 'dart:convert';

class Car {
  int id;
  String name;
  DateTime year;
  int cylinder;
  int doors;
  List<String> imagesUrls;
  double minPrice;
  double maxPrice;
  String motor;
  String country;
  List<String> colors;
  int tank;
  String gearBox;
  int powerHorse;
  String carType;
  String model;

  Car({
    required this.id,
    required this.name,
    required this.year,
    required this.cylinder,
    required this.doors,
    required this.imagesUrls,
    required this.minPrice,
    required this.maxPrice,
    required this.motor,
    required this.country,
    required this.colors,
    required this.tank,
    required this.gearBox,
    required this.powerHorse,
    required this.carType,
    required this.model,
  });

  factory Car.fromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return Car(
      id: data['id'],
      name: data['name'],
      year: DateTime.parse(data['year']),
      cylinder: data['cylinder'],
      doors: data['doors'],
      imagesUrls: List<String>.from(data['imagesUrls']),
      minPrice: data['minPrice'],
      maxPrice: data['maxPrice'],
      motor: data['motor'],
      country: data['country'],
      colors: List<String>.from(data['colors']),
      tank: data['tank'],
      gearBox: data['gearBox'],
      powerHorse: data['powerHorse'],
      carType: data['carType'],
      model: data['model'],
    );
  }
}
