import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier{

  late String ID;
  late String userrID;
  late String Biz;
  late String Tit;
  late String Image;
  late String Start;
  late String End;
  late String Paid;


  getselectedSlider(id,uid,biz,tit,mage,start,end,paid){
    ID=id;
    userrID=uid;
    Biz=biz;
    Tit=tit;
    Image=mage;
    Start=start;
    End=end;
    Paid=paid;
    notifyListeners();
  }

}