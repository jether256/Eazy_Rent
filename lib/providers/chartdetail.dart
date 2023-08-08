import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class ChatDetailsProvider with ChangeNotifier{


  late String ID;
  late String user_id;
  late String owner;
  late String phone;
  late String bizname;
  late String num;
  late String mail;
  late String image1;
  late String image2;
  late String image3;
  late String image4;
  late String image5;
  late String title;
  late String price;
  late String descc;
  late String adu;
  late String lat;
  late String lon;
  late String place;
  late String bed;
  late String bath;
  late String fun;
  late String con;
  late String bsft;
  late String csft;
  late String floors;
  late String kitchen;
  late String paid;
  late String start;
  late String end;
  late String blocked;
  late String type;
  late String proid;




  getselectedChart(id,uid,own,fon,name,number,email,mag1,
      mag2,mag3,mag4,mag5,tit,pri,desc,
      addr,latt,lonn,pl,bedo,batho,funo,cono,b,c,flo,
      kit,pay,sta,endd,blo,ty,proiid){

    ID=id;
    user_id=uid;
    owner=own;
    phone=fon;
    bizname=name;
    num=number;
    mail=email;
    image1=mag1;
    image2=mag2;
    image3=mag3;
    image4=mag4;
    image5=mag5;
    title=tit;
    price=pri;
    descc=desc;
    adu=addr;
    lat=latt;
    lon=lonn;
    place=pl;
    bed=bedo;
    bath=batho;
    fun=funo;
    con=cono;
    bsft=b;
    csft=c;
    floors=flo;
    kitchen=kit;
    paid=pay;
    start=sta;
    end=endd;
    blocked=blo;
    type=ty;
    proid=proid;
    notifyListeners();
  }

}
