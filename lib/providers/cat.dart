import 'dart:io';

import 'package:eazy_rent/api/services/services.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../models/housemodel.dart';
import '../models/servicemodel.dart';

class CategoryProvider with ChangeNotifier{

  ApiCall _service= new ApiCall();
  bool isLoading=false;
  bool isNet=false;

  List<CategoryModel> _catpros=[];
  List<CategoryModel> get catpros => _catpros;

  List<HouseModel> _catall=[];
  List<HouseModel> get catall => _catall;



  getCategory() async{

    try{

    isLoading=true;
    isNet=false;
    notifyListeners();

    final response =await _service.geCat();
    _catpros=response!;
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


  getAllCategoryDetail( String id) async {

    try{


      isLoading = true;
      isNet=false;
      notifyListeners();

      final response = await _service.getCatPro(id);
      _catall = response!;
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