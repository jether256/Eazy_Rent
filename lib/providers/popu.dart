

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/housemodel.dart';

class PopularProvider extends ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;

  List<HouseModel> _popular=[];
  List<HouseModel> get popular => _popular;

  getPopular() async{

    try{

      isLoading=true;

      notifyListeners();

      final response =await _service.getPOp();
      _popular=response!;
      isLoading=false;

      notifyListeners();

    } catch(e){

      isLoading=false;

      notifyListeners();

    }


  }

}