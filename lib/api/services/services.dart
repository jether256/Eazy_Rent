
import 'dart:convert';


import 'package:eazy_rent/logged-signup/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Navigation-details/dashboardnew.dart';
import '../../crypt/encrypt.dart';
import '../../logged-signup/checkcode.dart';
import '../../logged-signup/forget.dart';
import '../../logged-signup/loginCheck.dart';
import '../../models/aboutmodel.dart';
import '../../models/bannermodel.dart';
import '../../models/business.dart';
import '../../models/catpro.dart';
import '../../models/housemodel.dart';
import '../../models/servicemodel.dart';
import '../../models/termmodel.dart';
import '../url.dart';

class ApiCall{




  ///login function
  Future<Map<String,dynamic>?> LoginUz(String email,String password ,BuildContext context) async{

    var response = await http.post(
      Uri.parse(BaseUrl.apiLogin),
      headers: {"Accept": "headers/json"},
      body:{
        "email": encryp(email),
        "password": encryp(password),
      }
      ,
    );

    if (response.statusCode == 200) {

      var userData = json.decode(response.body);

      //Set json data to string variables

      String ID=userData['id'];
      String name=userData['name'];
      String email=userData['email'];
      String pass=userData['password'];
      String pic=userData['pic'];
      String num=userData['phone'];
      String log=userData['last_log'];
      String create=userData['create_date'];
      String ad=userData['addr'];
      String lat=userData['lat'];
      String lon=userData['lon'];
      String token=userData['token'];
      String type=userData['type'];
      String status=userData['status'];
      String renew=userData['renew_date'];
      String fcm=userData['fcmid'];




      if (userData == "ERROR") {

        if(context.mounted){


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Wrong Email or Password"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

          // final snackBar = SnackBar(
          //   elevation: 0,
          //   behavior: SnackBarBehavior.floating,
          //   backgroundColor: Colors.transparent,
          //   content: AwesomeSnackbarContent(
          //     title: 'Login Failure',
          //     message:
          //     'Failed to login',
          //     contentType: ContentType.failure,
          //   ),
          // );
          //
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);
        }

      }else{


        //Pass string variables into shared prefrences
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        sharedPreferences.setString("id",ID);
        sharedPreferences.setString("name",name);
        sharedPreferences.setString("email", email);
        sharedPreferences.setString("password", pass);
        sharedPreferences.setString("pic", pic);
        sharedPreferences.setString("phone",num);
        sharedPreferences.setString("last_log", log);
        sharedPreferences.setString("create_date", create);
        sharedPreferences.setString("addr", ad);
        sharedPreferences.setString("lat", lat);
        sharedPreferences.setString("lon", lon);
        sharedPreferences.setString("token", token);
        sharedPreferences.setString("type", type);
        sharedPreferences.setString("status", status);
        sharedPreferences.setString("renew_date", renew);
        sharedPreferences.setString("fcmid", fcm);

        String? UID=sharedPreferences.getString("id");

        // FirebaseMessaging.instance.subscribeToTopic("users");
        // FirebaseMessaging.instance.subscribeToTopic("users${UID}");

        if(context.mounted){

          Navigator.pushReplacementNamed(context,DashBoard.id);

          //EasyLoading.showSuccess(' Logged in...');


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Logged In"),
                backgroundColor: Colors.green.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

          //
          // final snackBar = SnackBar(
          //   elevation: 0,
          //   behavior: SnackBarBehavior.floating,
          //   backgroundColor: Colors.transparent,
          //   content: AwesomeSnackbarContent(
          //     title: 'Logged In',
          //     message:
          //     'Success fully Logged In',
          //     contentType: ContentType.success,
          //   ),
          // );
          //
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);

        }



        print(userData);
      }
    }else{

      return null;
    }



  }



  ///send Mail
  Future  sentMail( String email,BuildContext context) async {

    var response = await http.post(
      Uri.parse(
          BaseUrl.checkMail),
      //headers can be left out since CORS doesn't affect apps but it will affect A flutter web app,
      //so just to be safe include them.
      headers: {"Accept": "headers/json"},
      body:{
        "mail": encryp(email),
      },
    );


    if(response.statusCode==200){

      var userData=json.decode(response.body);

      if(context.mounted){// context is needed for the navigator and snackbar to work

        // check if the email already exists else register user
        if(userData=="Ye"){


          ///route to check email evrification code page after verification

          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginCheck(mail:email)));

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Email Sent"),
                backgroundColor: Colors.green.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

        else if(userData=="Fail"){


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Failed to send Email"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

        else if(userData=="No"){


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Email doesn't exist"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }


      }

    }else{

      return null;
    }





  }

  ///verify password function
  Future  PassVeri( String email, String code, BuildContext context) async {

    var response = await http.post(
      Uri.parse(
          BaseUrl.passVerify),
      //headers can be left out since CORS doesn't affect apps but it will affect A flutter web app,
      //so just to be safe include them.
      headers: {"Accept": "headers/json"},
      body:{
        "email": encryp(email),
        "key": encryp(code),
      },
    );


    if(response.statusCode==200){

      var userData=json.decode(response.body);

      if(context.mounted){// context is needed for the navigator and snackbar to work

        // check if the email already exists else register user
        if(userData=="ye"){


          ///route to password reset page after after verification
          //Navigator.pushNamed(context,ForgotPassword.id);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword(mail:email)));

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Verification Successfully Set new Password"),
                backgroundColor: Colors.green.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

        else if(userData=="no"){


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Wrong Code"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }


      }

    }else{

      return null;
    }





  }

  ///password reset
  Future<Map<String,dynamic>?> Reset(String password,BuildContext context, String email) async{

    var response = await http.post(
      Uri.parse(BaseUrl.passReset),
      headers: {"Accept": "headers/json"},
      body:{
        "mail": encryp(email),
        "pass": encryp(password),
      }
      ,
    );

    if (response.statusCode == 200) {

      var userData = json.decode(response.body);





      if (userData == "Yes") {

        if(context.mounted){

          ///route to login page after password reset
          //Navigator.pushNamed(context, Login.id);
          Navigator.pushReplacementNamed(context,LoginScreen.id);

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Password reset"),
                backgroundColor: Colors.green.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

      } else if(userData=="No"){


        if(context.mounted){

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Password reset failed"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );
        }


        print(userData);
      }
    }else{

      return null;
    }



  }



  ///register
  Future  Register( String name,String num, String email,  String password, BuildContext context) async {

    var response = await http.post(
      Uri.parse(
          BaseUrl.apiRegister),
      //headers can be left out since CORS doesn't affect apps but it will affect A flutter web app,
      //so just to be safe include them.
      headers: {"Accept": "headers/json"},
      body:{
        "name": encryp(name),
        "phone": encryp(num),
        "email": encryp(email),
        "password": encryp(password),
      },
    );


    if(response.statusCode==200){

      var userData=json.decode(response.body);

      if(context.mounted){// context is needed for the navigator and snackbar to work

        //final _userProvider=Provider.of<UserProvider>(context);


        // check if the email already exists else register user
        if(userData=="ERROR"){


          ///Navigator.pushNamed(context,SignUp.id);

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Email already exists"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

        else if(userData=="REG"){

          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: const Text("Succesfully registered"),
          //       backgroundColor: Colors.green.withOpacity(0.9),
          //       elevation: 10, //shadow
          //     )
          // );

          if (context.mounted) {

            Navigator.push(context,MaterialPageRoute(builder:(context)=>CheckCode(mail:email)));

            //Navigator.pushReplacementNamed(context, LoginScreen.id);
          }
        }



      }

    }else{

      return null;
    }





  }


  ///verify email function
  Future  MailVeri( String email, String code, BuildContext context) async {

    var response = await http.post(
      Uri.parse(
          BaseUrl.regVer),
      //headers can be left out since CORS doesn't affect apps but it will affect A flutter web app,
      //so just to be safe include them.
      headers: {"Accept": "headers/json"},
      body:{
        "email": encryp(email),
        "key": encryp(code),
      },
    );


    if(response.statusCode==200){

      var userData=json.decode(response.body);

      if(context.mounted){// context is needed for the navigator and snackbar to work

        // check if the email already exists else register user
        if(userData=="ye"){


          ///route to login page after verification
          //Navigator.pushNamed(context,Login.id);

          Navigator.pushReplacementNamed(context,LoginScreen.id);

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Verification Successfully Login Now"),
                backgroundColor: Colors.green.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }

        else if(userData=="no"){


          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Wrong Code"),
                backgroundColor: Colors.red.withOpacity(0.9),
                elevation: 10, //shadow
              )
          );

        }


      }

    }else{

      return null;
    }





  }




  ///get categories
  Future<List<CategoryModel>?> geCat() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiCategory),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return cartsFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }

  ///get categories houses
  Future<List<CatWithPro>?> geCatHa() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiCategoryHouse),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return cathouseFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }

  ///get banas
  Future<List<BanaModel>?> geBan() async {

    var response = await http.get(
        Uri.parse(BaseUrl.bana),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return banaFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }



  ///get house by category
  Future<List<HouseModel>?> getCatPro(String id) async {
    //var response = await http.get(Uri.parse(BaseUrl.category));

    var response = await http.post(
        Uri.parse(BaseUrl.apiCatDetail),
        headers: {"Accept": "headers/json"},
        body:{'name':id}
    );

    if (response.statusCode == 200) {
      return houseFromJson(
          json.decode(response.body)
      );
    } else {
      return null;
    }
  }


  ///get house
  Future<List<HouseModel>?> getHa() async {
    //var response = await http.get(Uri.parse(BaseUrl.category));

    var response = await http.get(
        Uri.parse(BaseUrl.apiAllHasi),
        headers: {"Accept": "headers/json"});

    if (response.statusCode == 200) {
      return houseFromJson(
          json.decode(response.body)
      );
    } else {
      return null;
    }
  }



  ///get get terms
  Future<List<TermsModel>?> terms() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiterms),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return termsFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }


  ///get get about
  Future<List<AboutModel>?> about() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiabout),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return aboutFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }



 // api/user/catalpro.php

  ///get business
  Future<List<BusinessModel>?> geB() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiBizi),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return bizFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }

  ///get search
  Future<List<HouseModel>?> getSearch(String location, String bed, String type, String mini, String maxi, BuildContext context) async {
    //var response = await http.get(Uri.parse(BaseUrl.category));

    var response = await http.post(
        Uri.parse(BaseUrl.apiSearchAll),
        headers: {"Accept": "headers/json"},
      body:{
        "loc":location,
        "bed":bed,
        "type":type,
        "mini":mini,
        "max":maxi,
      },
    );

    if (response.statusCode == 200) {
      return houseFromJson(
          json.decode(response.body)
      );
    } else {
      return null;
    }
  }

  ///get house by business
  Future<List<HouseModel>?> getBizPro(String id) async {
    //var response = await http.get(Uri.parse(BaseUrl.category));

    var response = await http.post(
        Uri.parse(BaseUrl.apiBizDetail),
        headers: {"Accept": "headers/json"},
        body:{'name':id}
    );

    if (response.statusCode == 200) {
      return houseFromJson(
          json.decode(response.body)
      );
    } else {
      return null;
    }
  }

  ///get house by business
  Future<List<HouseModel>?> getBizProp(String id) async {
    //var response = await http.get(Uri.parse(BaseUrl.category));

    var response = await http.post(
        Uri.parse(BaseUrl.apiOwnerDetails),
        headers: {"Accept": "headers/json"},
        body:{'uid':id}
    );

    if (response.statusCode == 200) {
      return houseFromJson(
          json.decode(response.body)
      );
    } else {
      return null;
    }
  }

  ///get popular houses
  Future<List<HouseModel>?> getPOp() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiPopular),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return houseFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }

  ///get deals
  Future<List<HouseModel>?> getDe() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiDeals),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return houseFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }

  ///get random houses
  Future<List<HouseModel>?> getRand() async {

    var response = await http.get(
        Uri.parse(BaseUrl.apiRand
        ),
        headers: {"Accept": "headers/json"});


    if (response.statusCode == 200) {

      return houseFromJson(
          json.decode(response.body)
      );

    } else {

      return null;

    }


  }




}