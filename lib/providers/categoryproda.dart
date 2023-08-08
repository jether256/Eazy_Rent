
import 'dart:io';

import 'package:eazy_rent/api/services/services.dart';
import 'package:flutter/cupertino.dart';
import '../models/housemodel.dart';

class CategoryProProvider extends ChangeNotifier{

  ApiCall _service= new ApiCall();

  bool isLoading=false;
  bool isNet=false;

  List<HouseModel> _asi=[];
  List<HouseModel> get asi => _asi;




  getCategoHouse(String id) async {

    try{
      isLoading=true;
      isNet=false;
      notifyListeners();

      final response = await _service.getCatPro(id);
      _asi=response!;
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