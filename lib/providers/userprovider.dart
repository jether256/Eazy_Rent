import 'package:flutter/cupertino.dart';

import '../api/services/services.dart';

class UserProvider with ChangeNotifier{

  ApiCall _service = new ApiCall();

  bool isLoading = false;

  Map<String,dynamic>? _reg;
  Map<String,dynamic> get data =>_reg!;

  Map<String,dynamic>? _login;
  Map<String,dynamic> get login =>_login!;


  Map<String,dynamic>? _sendmail;
  Map<String,dynamic> get sendmail =>_sendmail!;




  Map<String,dynamic>? _reset;
  Map<String,dynamic> get reset =>_reset!;


  Map<String,dynamic>? _passOTP;
  Map<String,dynamic> get passOTP =>_passOTP!;


  Map<String,dynamic>? _verify;
  Map<String,dynamic> get verify =>_verify!;


  registerUser({

    required BuildContext context, required String name, required String num, required String email, required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.Register(name,num,email,password,context);
    _reg=response as Map<String, dynamic>?;
    notifyListeners();

    isLoading=false;
    notifyListeners();
  }



  //Login
  void loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();


    final response = await _service.LoginUz(email,password, context);
    _login=response;
    isLoading=false;
    notifyListeners();
  }


  //verify forgot password otp
  sendMail({
    required String email,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.sentMail(email,context);
    _sendmail=response as Map<String, dynamic>?;
    notifyListeners();

    isLoading=false;
    notifyListeners();
  }

  //verify password otp
  verifyPassOtp({
    required String email,
    required BuildContext context,
    required String code,
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.PassVeri(email,code,context);
    _verify=response as Map<String, dynamic>?;
    notifyListeners();

    isLoading=false;
    notifyListeners();
  }


  //Login
  passReset({
    required String password,
    required BuildContext context, required String email
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.Reset(password, context,email);
    _reset=response;
    isLoading=false;
    notifyListeners();
  }





//Login
  // passReset({
  //   required String password,
  //   required BuildContext context, required String email
  // }) async {
  //   isLoading = true;
  //   notifyListeners();
  //
  //   final response = await _service.Reset(password, context,email);
  //   _reset=response;
  //   isLoading=false;
  //   notifyListeners();
  // }





}