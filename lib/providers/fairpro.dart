import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/housemodel.dart';

class FairProvider with ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;

  List<HouseModel> _fair=[];
  List<HouseModel> get fair => _fair;





  getFair() async{

    try{

      isLoading=true;

      notifyListeners();

      final response =await _service.getDe();
      _fair=response!;
      isLoading=false;

      notifyListeners();

    } catch(e){

      isLoading=false;

      notifyListeners();

    }


  }
}