import 'package:flutter/material.dart';

class HouseIDProvider with ChangeNotifier{

  String? selectedHouse;

  selectedPro(selected){
    selectedHouse=selected;
    notifyListeners();

  }
}