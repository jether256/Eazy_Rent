
import 'dart:convert';

List<BanaModel> banaFromJson(dynamic str) => List<BanaModel>.from(
    (str).map(
          (x)=>BanaModel.fromJson(x),
    ));

String banaToJson(List<BanaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BanaModel {

  final String id;
  final  String user_id;
  final  String bizname;
  final  String im;
  final String  tit;
  final String  start;
  final  String  end;
  final String  paid;


  BanaModel( {  required this.id, required this.user_id, required this.bizname,required this.im, required this.tit, required this.start, required this.end, required this.paid, });


  factory   BanaModel.fromJson(json){
    return     BanaModel(
      id:json['id'],
      user_id:json['user_id'],
      bizname:json['bizname'],
      tit:json['title'],
      im:json['image'],
      start :json['start'],
      end:json['end'],
      paid:json['paid'],

    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id":user_id ,
    "bizname":bizname ,
    "title": tit,
    "image": im,
    "start":start ,
    "end":end ,
    "paid":paid ,
  };

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id":user_id ,
      "bizname":bizname ,
      "title": tit,
      "image": im,
      "start":start ,
      "end":end ,
      "paid":paid ,
    };
  }



  factory  BanaModel.fromMap(Map<String, dynamic> json) {
    return    BanaModel(
      id:json['id'],
      user_id:json['user_id'],
      bizname:json['bizname'],
      tit:json['title'],
      im:json['image'],
      start :json['start'],
      end:json['end'],
      paid:json['paid'],
    );
  }

}
