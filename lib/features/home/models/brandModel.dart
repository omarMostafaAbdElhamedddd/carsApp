
class BrandModel{
 late var id ;
late String name ;


 BrandModel({required this.id , required this.name });

 factory BrandModel.fromjson(json){
   return BrandModel(id: json['id'], name: json['name']);
 }
}