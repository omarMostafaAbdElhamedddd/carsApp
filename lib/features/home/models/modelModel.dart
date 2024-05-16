

class ModelModell{
 late String name ;
  late var image ;
  late var id ;

  ModelModell({required this.image , required this.name , required this.id});


  factory ModelModell.fromjson(json){
    return ModelModell(image: json['imageUrl'], name: json['name'] , id: json['id']);
  }
}