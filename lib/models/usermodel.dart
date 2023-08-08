import 'dart:convert';

// UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));
// String welcomeToJson(UserModel data) => json.encode(data.toJson());

List< UserModel> userFromJson(String str) => List< UserModel >.from(json.decode(str).map((x) =>  UserModel.fromJson(x)));

String userToJson(List< UserModel > data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {

  final String ID;
  final  String name;
  final String  email;
  final String  num;
  final  String  pass;
  final String  pic;
  final String  lo;
  final String  lat;
  final String  ad;
  final  String  token;
  final String  renew;
  final String  status;
  final  String  type;
  final String  log;
  final String  create;
  final String  fcm;
  final String  veri;

  UserModel({required this.ID,required this.name,required this.email,required this.num,required this.pass,required this.pic,required this.lo,required this.lat,required this.ad,required this.token,required this.renew,required this.status,required this.type,required this.log,required this.create,required this.fcm,required this.veri, });


  factory UserModel.fromJson(json){
    return   UserModel(
      ID:json['id'].toString(),
      name:json['name'],
      email:json['email'],
      num:json['phone'],
      pass:json['password'],
      pic :json['pic'],
      lo:json['lon'],
      lat:json['lat'],
      ad:json['addr'],
      token:json['token'],
      status:json['status'],
      type:json['type'],
      create:json['create_date'],
      log:json['last_log'],
      renew: json['renew_date'],
      fcm: json['fcmid'],
      veri: json['veri_code']
    );
  }


  Map<String, dynamic> toJson() => {
    "id": ID,
    "name":name,
    "email":email,
    "phone":num,
    "password":pass,
    "pic":pic,
    "lon":lo,
    "lat":lat,
    "addr":ad,
    "token":token,
    "renew_date":renew,
    "status":status,
    "type":type,
    "create_date":create,
    "last_log":log,
    "fcmid":fcm,
    "veri_code":veri
  };

  Map<String, dynamic> toMap() {
    return {
      "id": ID,
      "name":name,
      "email":email,
      "phone":num,
      "password":pass,
      "pic":pic,
      "lon":lo,
      "lat":lat,
      "addr":ad,
      "token":token,
      "renew_date":renew,
      "status":status,
      "type":type,
      "create_date":create,
      "last_log":log,
      "fcmid":fcm,
      "veri_code":veri
    };
  }



  factory UserModel.fromMap(Map<String, dynamic> json) {
    return   UserModel(
      ID:json['id'],
      name:json['name'],
      email:json['email'],
      num:json['phone'],
      pass:json['password'],
      pic :json['pic'],
      lo:json['lon'],
      lat:json['lat'],
      ad:json['addr'],
      token:json['token'],
      renew:json['renew_date'],
      status:json['status'],
      type:json['type'],
      create:json['create_date'],
      log:json['last_log'],
      fcm: json['fcmid'],
        veri: json['veri_code']
    );
  }

}
