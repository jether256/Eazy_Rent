
import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../api/services/services.dart';
import '../models/catpro.dart';


class CatHouseProvider with ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;


  List<CatWithPro> _ko=[];
  List<CatWithPro> get ko => _ko;



  getCatho() async{

    try{

      isLoading=true;
      isNet=false;
      notifyListeners();

      final response =await _service.geCatHa();
      _ko=response!;
      isLoading=false;
      isNet=false;
      notifyListeners();

    }on SocketException catch (_) {

      isLoading= false;
      isNet=true;
      notifyListeners();

    } catch(e){

      isLoading=false;
      isNet=false;
      notifyListeners();

    }


  }




}