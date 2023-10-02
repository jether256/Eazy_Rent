import 'dart:convert';

List<AboutModel> aboutFromJson(dynamic str) => List<AboutModel>.from(
    (str).map(
          (x)=>AboutModel.fromJson(x),
    ));

String aboutToJson(List<AboutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutModel {
  final String ID;
  final String Nem;

  AboutModel({
    required this.ID,  required this.Nem
  });


  factory AboutModel.fromJson(data){
    return   AboutModel(
      ID:data['id'],
      Nem:data['descc'],
    );
  }


  Map<String, dynamic> toJson() => {
    "id": ID,
    "descc":Nem,
  };



  Map<String, dynamic> toMap() {
    return {
      "id": ID,
      "descc":Nem,
    };
  }



  factory AboutModel.fromMap(Map<String, dynamic> data) {
    return   AboutModel(
      ID:data['id'],
      Nem:data['descc'],
    );
  }

}
