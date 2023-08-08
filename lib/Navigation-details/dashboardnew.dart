import 'package:eazy_rent/Navigation-details/profile.dart';
import 'package:eazy_rent/Navigation-details/save.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/cola.dart';

import 'homenew.dart';
import 'kato.dart';



class DashBoard extends StatefulWidget {

  static const  String id='dashboard Logged';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  bool isLoggedIn=false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }


  _checkLoginStatus() async {
    SharedPreferences localStorage= await SharedPreferences.getInstance();
    var Id=localStorage.getString('id');

    if(Id != null){

      setState(() {
        isLoggedIn=true;
      });
    }

  }

  int _selectedIndex=0;

  static final List<Widget> _widgetOptionsLogged=<Widget>[
    HomeNew(),
    Kato(),
    Saved(),
    Profile(),
  ];

  static final List<Widget> _widgetOptionsLoggedNot=<Widget>[
    HomeNew(),
    Kato(),
    Saved(),
    Profile(),
  ];


  void _onItemTapped(int index){

    setState(() {
      _selectedIndex=index;
    });
  }




  int currentIndex=0;

  // void onTap(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  //
  // }

    @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      child: Scaffold(
        backgroundColor:Colors.lightBlue,

        bottomNavigationBar:  BottomAppBar(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                gradient: LinearGradient(
                    colors: [
                      blueGradient.darkShade,
                      blueGradient.lightShade,
                    ]
                )
            ),
            child:Row(
              children: [
                MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(_selectedIndex== 0 ? Icons.home:Icons.home_outlined,color:_selectedIndex== 0 ? Colors.red.shade700:Colors.white,size: _selectedIndex == 0 ? 30:23)
                      ],
                    ),
                    onPressed:(){


                      _onItemTapped(0);
                    }

                ),

                MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(_selectedIndex== 1 ? Icons.dashboard:Icons.dashboard_outlined,color: _selectedIndex== 1 ? Colors.red.shade700:Colors.white,size: _selectedIndex == 1 ? 30:23,)
                      ],
                    ),
                    onPressed:(){


                      _onItemTapped(1);
                    }

                ),
                MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Icon(_selectedIndex== 2 ?Icons.search:Icons.search_rounded,color:_selectedIndex== 2 ? Colors.red.shade700:Colors.white,size: _selectedIndex == 2 ? 30:23) ,
                      ],
                    ),
                    onPressed:(){


                      _onItemTapped(2);

                    }

                ),
                MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(_selectedIndex== 3 ?Icons.person:Icons.person_outline_outlined,color:_selectedIndex== 3 ? Colors.red.shade700:Colors.white,size: _selectedIndex == 3 ? 30:23)
                      ],
                    ),
                    onPressed:(){



                      _onItemTapped(3);
                    }

                ),
              ],
            ) ,
          ),

        ),
        // extendBody: true,
        body:isLoggedIn ? _widgetOptionsLogged[_selectedIndex]:_widgetOptionsLoggedNot[_selectedIndex],
        // bottomNavigationBar:CurvedNavigationBar(
        //   color:themeProvider.isDarkMode ? Colors.grey.shade700:mainColor,
        //   buttonBackgroundColor:themeProvider.isDarkMode ? Colors.grey.shade700:mainColor,
        //   backgroundColor: Colors.transparent,
        //   height: 60,
        //   items:items,
        //   animationCurve: Curves.easeInOut,
        //   animationDuration: const Duration(microseconds: 300),
        //   index:currentIndex,
        //   onTap:onTap,
        // ),
      ),
      onWillPop:() async{

        return false;
      },
    );
  }
}
