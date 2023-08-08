

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/housemodel.dart';

class RandomProvider extends ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;

  List<HouseModel> _rand=[];
  List<HouseModel> get rand => _rand;

  getRandHousi() async{

    try{

      isLoading=true;

      notifyListeners();

      final response =await _service.getRand();
      _rand=response!;
      isLoading=false;

      notifyListeners();

    } catch(e){

      isLoading=false;

      notifyListeners();

    }


  }
}