import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/housemodel.dart';

class HouseProvider with ChangeNotifier {

  ApiCall _service = new ApiCall();
  bool isLoading = false;
  bool isNet = false;
  bool isEmp=false;

  List<HouseModel> _all = [];

  List<HouseModel> get all => _all;

  List<HouseModel> _allc = [];

  List<HouseModel> get allc => _allc;


  List<HouseModel> _search = [];

  List<HouseModel> get search => _search;



  searchProduct({required String text}){

    try {

      isLoading = true;
      isNet = false;
      isEmp=false;
      notifyListeners();

      if(text.isEmpty){

        isEmp=true;
        isLoading = false;
        isNet = false;
      }else{

        all.forEach((element){

          if(element.tit.toLowerCase().contains(text)){
            search.add(element);
            isEmp=false;
            isLoading = false;
            isNet = false;
            notifyListeners();
          }
        });

        isEmp=false;
        isLoading = false;
        isNet = false;
        notifyListeners();

      }



    }on SocketException catch (_) {

    isLoading = false;
    isNet = true;
    notifyListeners();

    } catch (e) {

    isLoading = false;
    isNet = false;
    notifyListeners();

    }

  }



  getHouse() async {
    try {
      isLoading = true;
      isNet = false;
      notifyListeners();

      final response = await _service.getHa();
      _all = response!;
      isLoading = false;
      isNet = false;
      notifyListeners();
    } on SocketException catch (_) {
      isLoading = false;
      isNet = true;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      isNet = false;
      notifyListeners();
    }
  }


  getAllCategoryDetail(String id) async {
    try {
      isLoading = true;
      isNet = false;
      notifyListeners();

      final response = await _service.getCatPro(id);
      _allc = response!;
      isLoading = false;
      isNet = false;

      notifyListeners();
    } on SocketException catch (_) {
      isLoading = false;
      isNet = true;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      isNet = false;
      notifyListeners();
    }
  }


}