
import 'dart:convert';

List<TermsModel> termsFromJson(dynamic str) => List<TermsModel>.from(
    (str).map(
          (x)=>TermsModel.fromJson(x),
    ));

String termsToJson(List<TermsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsModel {
  final String ID;
  final String Nem;

  TermsModel({
    required this.ID,  required this.Nem
  });


  factory TermsModel.fromJson(data){
    return   TermsModel(
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



  factory TermsModel.fromMap(Map<String, dynamic> data) {
    return   TermsModel(
      ID:data['id'],
      Nem:data['descc'],
    );
  }

}
