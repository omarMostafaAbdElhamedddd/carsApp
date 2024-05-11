
class BrandModel{
 late String id ;
late String name ;
 late String ? image ;

 BrandModel({required this.id , required this.name ,required this.image});

 factory BrandModel.fromjson(json){
   return BrandModel(id: json['id'], name: json['name'], image: json['iameg']);
 }
}