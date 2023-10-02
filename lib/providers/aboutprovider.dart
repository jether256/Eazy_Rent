
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/aboutmodel.dart';

class AboutProvider extends ChangeNotifier{

  ApiCall _service = new ApiCall();

  bool isNet=false;
  bool isLoading=false;

  List<AboutModel> _about=[];
  List<AboutModel> get about => _about;


  getAbout() async {

    try {
      isNet = false;
      isLoading = true;
      notifyListeners();

      final response = await _service.about();
      _about = response!.cast<AboutModel>();

      isNet = false;
      isLoading = false;
      notifyListeners();

    }on SocketException catch (_) {
      isLoading = false;
      isNet = true;
      notifyListeners();

    }catch(e){
      isLoading = false;
      isNet = false;
      notifyListeners();

    }


  }


}