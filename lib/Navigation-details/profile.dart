import 'package:eazy_rent/Navigation-details/terms/termsss.dart';
import 'package:eazy_rent/providers/termspro.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logged-signup/login.dart';

import 'about/aboutus.dart';
import 'acount/editacc.dart';
import 'contactus/kota.dart';
import 'dashboardnew.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  bool isLoggedIn=false;

  @override
  void initState() {

    _checkLoginStatus();


    getPref();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<TermsProvider>(context,listen: false);

    });

    super.initState();
  }

  String? nem;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {

      nem= sharedPreferences.getString("name");
      //lnem= sharedPreferences.getString("cust_lname");


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


  please(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:Colors.cyan.withOpacity(0.8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/loo.png',height: 50,width: 50,)
            ],
          ),
          content: const Text('Please Login first to continue',style:TextStyle(color:Colors.white),),
          actions: [
            MaterialButton(
              color: Colors.blue,
              //hoverColor: Colors.green,
              textColor: Colors.white,
              onPressed: () {

                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
              child: const Text('Login'),
            ),
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {

                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title:const Text('Account',maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
      ),
      backgroundColor:Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.only(left: 10,right: 10,top:10,bottom: 60),
        children:  [

          Container(
            decoration: BoxDecoration(
              color:Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child:  ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: AssetImage('assets/images/loo.png',),
              ),
              title: Text(isLoggedIn ?' ${nem}':'Profile',style: const TextStyle(fontSize: 20),),
              subtitle: const Text('Profile'),
            ),
          ),
          const SizedBox(height: 5),
          const Divider(height: 5,thickness: 5,),

          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color:  Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                //profile
                ListTile(
                  onTap: (){





                    isLoggedIn ?  Navigator.push(context, MaterialPageRoute(builder:(context)=>const EditAccountPro())):please();



                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person,color: Colors.blue,size: 35,),
                  ),
                  title: Text(isLoggedIn ?'${nem}':'Account',style: TextStyle(fontSize: 18),),
                  trailing:const Icon(Icons.arrow_forward_ios_outlined),

                ),

                const SizedBox(height: 10,),

                //notifications
                ListTile(
                  onTap: (){


                    //isLoggedIn ?  Navigator.push(context, MaterialPageRoute(builder:(context)=>const EditAccountPro())):please();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactEazy(),
                        )
                    );


                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.contact_page,color: Colors.indigo,size: 35,),
                  ),
                  title: const Text('Contact Us',style: TextStyle(fontSize: 18),),
                  trailing:const Icon(Icons.arrow_forward_ios_outlined),

                ),

                const SizedBox(height: 10,),


                //terms
                ListTile(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsPro(),
                        )
                    );

                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.file_copy_outlined,color:Colors.green,size: 35,) ,
                  ),
                  title: const Text('Terms And Conditions',style: TextStyle(fontSize: 18),),
                  trailing:const Icon(Icons.arrow_forward_ios_outlined),

                ),

                const SizedBox(height: 10,),

                //orders
                // ListTile(
                //   onTap: (){
                //
                //
                //     isLoggedIn ?  Navigator.push(context, MaterialPageRoute(builder:(context)=>const MyOrders())):please();
                //
                //     //EasyLoading.showSuccess('Privacy orders clicked.....');
                //   },
                //   leading: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.indigo.shade100,
                //       shape: BoxShape.circle,
                //     ),
                //     child: const Icon(Icons.shop_two,color: Colors.indigo,size: 35,),
                //   ),
                //   title: const Text('Orders',style: TextStyle(fontSize: 18),),
                //   trailing:const Icon(Icons.arrow_forward_ios_outlined),
                //
                // ),

                const SizedBox(height: 10,),

                //about us
                ListTile(
                  onTap: (){




                    Navigator.push(context, MaterialPageRoute(builder:(context)=>const AboutUs()));


                    //EasyLoading.showSuccess('About us clicked.....');

                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mail,color: Colors.orange,size: 35,),
                  ),
                  title: const Text('About us',style: TextStyle(fontSize: 18),),
                  trailing:const Icon(Icons.arrow_forward_ios_outlined),

                ),

                const SizedBox(height: 10,),

                //theme
                ListTile(
                  onTap: (){

                    // LaunchReview.launch(
                    //   androidAppId: "https://play.google.com/store/apps/details?id=com.easy_rent_owner.eazy_rent",
                    //   //iOSAppId: "585027354",
                    // );



                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.rate_review_outlined,color: Colors.red,size: 35,),
                  ),
                  title: const Text('Rate Us',style: TextStyle(fontSize: 18),),
                  trailing:const Icon(Icons.arrow_forward_ios_outlined),

                ),
              ],
            ),
          ),



          const Divider(thickness: 5,),

          const SizedBox(height: 3,),


          //logout
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListTile(
              onTap: (){

                isLoggedIn ? lougOut():please();

                //EasyLoading.showSuccess('Logout clicked.....');
              },
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.login_outlined,color: Colors.red,size: 35,),
              ),
              title: const Text('Log out',style: TextStyle(fontSize: 18),),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),

            ),
          ),

        ],
      ),
    );
  }
}


