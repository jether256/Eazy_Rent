import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Navigation-details/dashboardnew.dart';



class Splash extends StatefulWidget {

  static const  String id='splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {



  @override
  void initState() {


    Timer( const Duration(seconds: 3,),(){


      Navigator.pushReplacementNamed(context,DashBoard.id);


    });

    super.initState();
  }



  // String? ID1;
  // //String? Type;
  //
  // getPref1() async{
  //   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //   setState(() {
  //     ID1=sharedPreferences.getString(PrefInfo.ID);
  //     ID1== null ? sessionLogout():sessionLogin();
  //
  //    /// Navigator.pushReplacementNamed(context, DashNot.id);
  //
  //   });
  // }
  //
  //
  // sessionLogout() {
  //   Navigator.pushReplacementNamed(context,DashNot.id);
  // }
  //
  // sessionLogin() {
  //
  //   Navigator.pushReplacementNamed(context,DashBoardLogged.id);
  //
  // }


  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.black,
      Colors.blue,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,
         );


    return Scaffold(

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset('assets/images/loo.png',height: 200,),
            const SizedBox(height: 10,),

            // AnimatedTextKit(
            //   animatedTexts: [
            //     ColorizeAnimatedText(
            //       'Eazy Rent',
            //       textStyle: colorizeTextStyle,
            //       colors: colorizeColors,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}