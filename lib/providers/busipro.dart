
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/business.dart';
import '../models/housemodel.dart';

class BusinessProvider with ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;


  List<BusinessModel> _biz=[];
  List<BusinessModel> get biz => _biz;

  List<HouseModel> _bizall=[];
  List<HouseModel> get bizall => _bizall;

  List<HouseModel> _balo=[];
  List<HouseModel> get balo => _balo;

  getBizne() async{

    try{

      isLoading=true;
      isNet=false;
      notifyListeners();

      final response =await _service.geB();
      _biz=response!;
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


  getAllBizDetail( String id) async {

    try{


      isLoading = true;
      isNet=false;
      notifyListeners();

      final response = await _service.getBizPro(id);
      _bizall = response!;
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



  getAllHouseDe( String id) async {

    try{


      isLoading = true;
      isNet=false;
      notifyListeners();

      final response = await _service.getBizProp(id);
      _balo = response!;
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