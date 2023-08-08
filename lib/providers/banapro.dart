

import 'dart:io';

import 'package:eazy_rent/api/services/services.dart';
import 'package:flutter/cupertino.dart';

import '../models/bannermodel.dart';

class BanaProvider extends ChangeNotifier{

  ApiCall _service= new ApiCall();

  bool isLoading=false;
  bool isNet=false;

  List<BanaModel> _bana=[];
  List<BanaModel> get bana => _bana;



  getAllBanas() async {

    try{
      isLoading=true;
      isNet=false;
      notifyListeners();

      final response =await _service.geBan();
      _bana=response!;

      isLoading=false;
      isNet=false;
      notifyListeners();



    }
    on SocketException catch (_) {

      isLoading = false;
      isNet = true;
      notifyListeners();

    } catch(e){

      isLoading=false;
      isNet=false;
      notifyListeners();

    }
  }


}