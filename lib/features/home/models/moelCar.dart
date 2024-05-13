
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

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      year: DateTime.parse(json['year']),
      cylinder: json['cylinder'],
      doors: json['doors'],
      imagesUrls: List<String>.from(json['imagesUrls']),
      minPrice: json['minPrice'].toDouble(),
      maxPrice: json['maxPrice'].toDouble(),
      motor: json['motor'],
      country: json['country'],
      colors: List<String>.from(json['colors']),
      tank: json['tank'],
      gearBox: json['gearBox'],
      powerHorse: json['powerHorse'],
      carType: json['carType'],
      model: json['model'],
    );
  }
}

