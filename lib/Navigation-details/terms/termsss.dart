import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/termspro.dart';
import '../dashboardnew.dart';

class TermsPro extends StatefulWidget {
  const TermsPro({super.key});

  @override
  State<TermsPro> createState() => _TermsProState();
}

class _TermsProState extends State<TermsPro> {


  final _formated= NumberFormat();

  bool isLoggedIn=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<TermsProvider>(context,listen: false).getTerms();


    });
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


  lougOut() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


    String? UID=sharedPreferences.getString("id");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users${UID}");

    sharedPreferences.remove("id");
    sharedPreferences.remove("name");
    sharedPreferences.remove("email");
    sharedPreferences.remove("password");
    sharedPreferences.remove("pic");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("last_log");
    sharedPreferences.remove("create_date");
    sharedPreferences.remove("addr");
    sharedPreferences.remove("lat");
    sharedPreferences.remove("lon");
    sharedPreferences.remove("token");
    sharedPreferences.remove("type");
    sharedPreferences.remove("status");
    sharedPreferences.remove("renew_date");
    sharedPreferences.remove("fcmid");




    if(mounted){
      Navigator.pushReplacementNamed(context, DashBoard.id);
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          //leading: IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
          //leading: Image.asset("assets/images/logo.png",color: Colors.white,),
          title: const Text('Terms and Privacy Policy',style: TextStyle(color: Colors.white),),
          actions: [
            // IconButton(icon:const Icon(Icons.login_outlined), onPressed: () {
            //
            //   lougOut();
            // },),

          ],
          elevation: 2,
          centerTitle: true,
          backgroundColor:Colors.lightBlue,

        ) ,
        body:Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
          child: Container(
            child: Consumer<TermsProvider>(
              builder: (context,value,child){

                final pros=value.terms;

                if(value.isLoading){

                  return GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 1/1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Image.asset('assets/images/hug.gif'),
                        );



                      }
                  );

                }

                else if(value.isNet){

                  return GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 1/1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Image.asset('assets/images/disconnected.png'),
                        );



                      }
                  );
                }

                else{




                  return ListView.builder(
                      itemCount: pros.length,

                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(pros[index].Nem),
                          ),
                        );



                      }
                  );
                }


              },
            ),
          ),
        ),

      ),
    );
  }
}
