
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';
import '../models/termmodel.dart';

class TermsProvider extends ChangeNotifier{

  ApiCall _service = new ApiCall();

  bool isNet=false;
  bool isLoading=false;

  List<TermsModel> _terms=[];
  List<TermsModel> get terms => _terms;


  getTerms() async {

    try {
      isNet = false;
      isLoading = true;
      notifyListeners();

      final response = await _service.terms();
      _terms = response!;

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