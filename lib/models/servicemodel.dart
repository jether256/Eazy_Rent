

import 'dart:convert';

List<CategoryModel> cartsFromJson(dynamic str) => List<CategoryModel>.from(
    (str).map(
          (x)=>CategoryModel.fromJson(x),
    ));

String categoryToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  final String ID;
  final String Nem;
  final  String Im;

  CategoryModel({
    required this.ID,  required this.Nem,required this.Im,
  });


  factory CategoryModel.fromJson(data){
    return   CategoryModel(
      ID:data['id'],
      Nem:data['name'],
      Im:data['pic'],
    );
  }


  Map<String, dynamic> toJson() => {
  "id": ID,
  "name":Nem,
  "pic":Im,
  };



  Map<String, dynamic> toMap() {
    return {
      "id": ID,
      "name":Nem,
      "pic":Im,
    };
  }



  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return   CategoryModel(
      ID:data['id'],
      Nem:data['name'],
      Im:data['pic'],
    );
  }

}
