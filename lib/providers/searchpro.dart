
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/housemodel.dart';

class SearchProvider with ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;


  List<HouseModel> _sir=[];
  List<HouseModel> get sir => _sir;


  getAllSearch({
    required String location,
    required String bed,
    required String type,
    required String mini,
    required String maxi,
    required BuildContext context} ) async {

    try{


      isLoading = true;
      isNet=false;
      notifyListeners();

      final response = await _service.getSearch(location,bed,type,mini,maxi,context);
      _sir = response!;
      isLoading = false;
      isNet=false;

      notifyListeners();

    }on SocketException catch (_) {

      isLoading= false;
      isNet=true;
      notifyListeners();

    } catch (e) {

      isLoading = false;
      isNet=false;
      notifyListeners();


    }


  }

}