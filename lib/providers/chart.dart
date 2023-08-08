
import 'package:flutter/cupertino.dart';

class ChartRoomProvider with ChangeNotifier{

  late String ID;

  selectedChat(id,){
    ID=id;
    notifyListeners();
  }

}