
List<CatWithPro> cathouseFromJson(dynamic str) => List<CatWithPro>.from(
    (str).map(
          (x)=>CatWithPro.fromJson(x),
    ));



class CatWithPro{

  final String ID;
  final String Nem;
  final  String Im;
  final List<HouseeModel> house;
  CatWithPro({
    required this.ID,  required this.Nem,required this.Im,required this.house
  });



  factory CatWithPro.fromJson( data){
    var list = data['house'] as List;
    List<HouseeModel> listHouse =
    list.map((e) => HouseeModel.fromJson(e)).toList();
    return CatWithPro(
        ID: data['id'],
        Nem: data['name'],
        Im: data['pic'],
        house: listHouse);
  }


}

class HouseeModel {

  final String ID;
  final  String u_id;
  final String  own;
  final String  phon;
  final  String  biz;
  final String  num;
  final String  mail;
  final String  img1;
  final String  img2;
  final  String  img3;
  final String  img4;
  final String  img5;
  final  String  tit;
  final String  pr;
  final String  desc;
  final String  adu;
  final String  lat;
  final String  lon;
  final String  plac;
  final String  bed;
  final String  bath;
  final String  fun;
  final String  con;
  final String  b;
  final String  c;
  final String  fl;
  final String  kit;
  final String  paid;
  final String  start;
  final String  end;
  final String  blo;
  final String  type;
  final String  proi;

  HouseeModel( {required this.proi,required this.ID, required this.u_id, required this.own, required this.phon, required this.biz, required this.num, required this.mail, required this.img1, required this.img2, required this.img3,
    required this.img4, required this.img5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.plac, required this.bed, required this.bath,
    required this.fun, required this.con, required this.b, required this.c, required this.fl, required this.kit, required this.paid, required this.start, required this.end, required this.blo, required this.type} );



  factory HouseeModel.fromJson(json){
    return   HouseeModel(
        ID:json['ID'].toString(),
        u_id:json['user_id'],
        own:json['owner'],
        phon:json['phone'],
        biz:json['bizname'],
        num:json['num'],
        mail:json['mail'],
        img1:json['image1'],
        img2:json['image2'],
        img3:json['image3'],
        img4:json['image4'],
        img5:json['image5'],
        tit:json['title'],
        pr:json['price'],
        desc:json['descc'],
        adu:json['adu'],
        lat:json['lat'],
        lon:json['lon'],
        plac:json['place'],
        bed:json['bed'],
        bath:json['bath'],
        fun:json['fun'],
        con:json['con'],
        b:json['bsqft'],
        c:json['csqft'],
        fl:json['floors'],
        kit:json['kitchen'],
        paid:json['paid'],
        start:json['start'],
        end:json['end'],
        blo:json['blocked'],
        type:json['type'],
        proi: json['pro_id']
    );
  }


  Map<String, dynamic> toJson() => {
    "ID":ID,
    "user_id":u_id,
    "owner":own,
    "phone":phon,
    "bizname":biz,
    "num":num,
    "mail":mail,
    "image1":img1,
    "image2":img2,
    "image3":img3,
    "image4":img4,
    "image5":img5,
    "title":tit,
    "price":pr,
    "descc":desc,
    "adu":adu,
    "lat":lat,
    "lon":lon,
    "place":plac,
    "bed":bed,
    "bath":bath,
    "fun":fun,
    "con":con,
    "bsqft":b,
    "csqft":c,
    "floors":fl,
    "kitchen":kit,
    "paid":paid,
    "start":start,
    "end":end,
    "blocked":blo,
    "type":type,
    "pro_id":proi
  };

  Map<String, dynamic> toMap() {
    return {
      "ID":ID,
      "user_id":u_id,
      "owner":own,
      "phone":phon,
      "bizname":biz,
      "num":num,
      "mail":mail,
      "image1":img1,
      "image2":img2,
      "image3":img3,
      "image4":img4,
      "image5":img5,
      "title":tit,
      "price":pr,
      "descc":desc,
      "adu":adu,
      "lat":lat,
      "lon":lon,
      "place":plac,
      "bed":bed,
      "bath":bath,
      "fun":fun,
      "con":con,
      "bsqft":b,
      "csqft":c,
      "floors":fl,
      "kitchen":kit,
      "paid":paid,
      "start":start,
      "end":end,
      "blocked":blo,
      "type":type,
      "pro_id":proi
    };
  }



  factory HouseeModel.fromMap(Map<String, dynamic> json) {
    return   HouseeModel(
        ID:json['ID'],
        u_id:json['user_id'],
        own:json['owner'],
        phon:json['phone'],
        biz:json['bizname'],
        num:json['num'],
        mail:json['mail'],
        img1:json['image1'],
        img2:json['image2'],
        img3:json['image3'],
        img4:json['image4'],
        img5:json['image5'],
        tit:json['title'],
        pr:json['price'],
        desc:json['descc'],
        adu:json['adu'],
        lat:json['lat'],
        lon:json['lon'],
        plac:json['place'],
        bed:json['bed'],
        bath:json['bath'],
        fun:json['fun'],
        con:json['con'],
        b:json['bsqft'],
        c:json['csqft'],
        fl:json['floors'],
        kit:json['kitchen'],
        paid:json['paid'],
        start:json['start'],
        end:json['end'],
        blo:json['blocked'],
        type:json['type'],
        proi: json['pro_id']
    );
  }

}

