

class ModelModell{
 late String name ;
  late String image ;
  late String id ;

  ModelModell({required this.image , required this.name , required this.id});


  factory ModelModell.fromjson(json){
    return ModelModell(image: json['image'], name: json['name'] , id: json['id']);
  }
}