
import 'package:eazy_rent/Navigation-details/places/places.dart';
import 'package:eazy_rent/Navigation-details/random/random.dart';
import 'package:eazy_rent/Navigation-details/ratin.dart';
import 'package:eazy_rent/Navigation-details/search.dart';
import 'package:eazy_rent/Navigation-details/widgets/fair.dart';
import 'package:eazy_rent/Navigation-details/widgets/popular.dart';
import 'package:eazy_rent/Navigation-details/widgets/sliverrr.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../logged-signup/login.dart';

import 'banner/bannnerrrr.dart';
import 'businesses/business.dart';
import 'category/cat.dart';
import 'dashboardnew.dart';
import 'deals/delo.dart';
import 'more/morepop.dart';
class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {

  final AppRating appRat= new AppRating();

  String? ID,nem,lnem,mail,phone,locat,pic,pass,count,date;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      ID= sharedPreferences.getString("id");
      nem= sharedPreferences.getString("name");
      mail= sharedPreferences.getString("email");
      phone= sharedPreferences.getString("phone");
      

    });
  }

  bool isLoggedIn=false;

  @override
  void initState() {
    super.initState();
    appRat.rateApp(context);
    getPref();
    _checkLoginStatus();
    //_checkVersion();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

     // Provider.of<ShoppingCartProvider>(context,listen: false).getCartCount();
      //Provider.of<MyOrdersProviders>(context,listen: false).getOrderNotiCount();
    });


  }


  //
  // void _checkVersion () async{
  //
  //   final newVersion=NewVersion(
  //     androidId:"https://play.google.com/store/apps/details?id=com.easy_rent_owner.eazy_rent",
  //     //iOSId: 'com.google.Vespa',
  //   );
  //
  //   final status= await newVersion.getVersionStatus();
  //   newVersion.showUpdateDialog(
  //     context: context,
  //     versionStatus:status!,
  //     dialogTitle: 'Update!!!!',
  //     dismissButtonText: 'Skip',
  //     dialogText: 'Please update the app from' +status.localVersion + 'to' +status.storeVersion,
  //     dismissAction: (){
  //       SystemNavigator.pop();
  //     },
  //     updateButtonText: 'Lets update',
  //   );
  //
  //   print("DEVICE:" + status.localVersion);
  //   print("STORE:" + status.storeVersion);
  //
  // }




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
        backgroundColor:Colors.grey[100],
        appBar:AppBar(
          //leading: IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset("assets/images/loo.png",height: 40,width: 40,color: Colors.white,),
          ),
          title:ID == null ? Text(''):Text('Welcome ${nem}',maxLines: 1,) ,

          actions: [


            ID == null ? IconButton(icon:const Icon(Icons.account_circle_outlined), onPressed: () {

              Navigator.push(context,MaterialPageRoute(builder:(BuildContext context){
                return LoginScreen();
              }));




            },):IconButton(icon:const Icon(Icons.logout), onPressed: () {


              lougOut();




            },),





          ],
          elevation: 0,
          centerTitle: true,
          // backgroundColor:Col,
          bottom:  PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child:Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                        child:InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SearchHouses()));
                          },
                          child: Container(
                            child:TextField(
                              enabled: false,
                              onTap: (){

                                //showSearch(context: context, delegate:SearchAds(list:searchList));



                              },
                              decoration: InputDecoration(
                                hintText: 'Search a property',
                                prefixIcon: Icon(Icons.search,color:Colors.grey ,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor:Colors.grey.shade200,
                              ),

                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          children: const [
                            Icon(Icons.info_outline,size:12,color:Colors.white),
                            Text('100 % Genuine',style: TextStyle(color: Colors.white,fontSize:12 ),)
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.work,size:12,color:Colors.white),
                            Text('24-7 working days',style: TextStyle(color: Colors.white,fontSize:12 ),)
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.production_quantity_limits,size:12,color:Colors.white),
                            Text('Trusted Properties',style: TextStyle(color: Colors.white,fontSize:12 ),)
                          ],
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ) ,
          ),

        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 4),
          children: [

            //search widget
            //SearchWidget(),

            const SizedBox(height: 4,),

            //Banner widget
           const BannerSlider(),

            //category
            const SizedBox(height: 10,),




            //category
            const SizedBox(height: 10,),

            //category widget
            Container(
              decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/face.gif',height: 30,),
                        const Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ],
                    ),
                  ),
                  //const ActionCategory(),
                  const Categoryi(),
                ],
              ),
            ),

            const SizedBox(height: 10,),


            const SizedBox(height: 10,),

            //best Sellers products widget
            Container(
              decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/off.gif',height: 30,),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Deals',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: (){

                              //view more of the products

                              Navigator.push(context,MaterialPageRoute(builder:(context) => const Deals()));


                            },
                            child: const Text('View More',)
                        )
                      ],
                    ),
                  ),
                  //const ProductsWidget(),
                  const FairPrice(),
                ],
              ),
            ),

            const SizedBox(height: 10,),

            //popular
            Container(
              decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/off.gif',height: 30,),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Popular Areas',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: (){

                              //view more of the products

                              Navigator.push(context,MaterialPageRoute(builder:(context) => const PlacesMore()));


                            },
                            child: const Text('View More',)
                        )
                      ],
                    ),
                  ),
                  //const ProductsWidget(),
                  const PopularHouses(),
                ],
              ),
            ),

            const SizedBox(height: 10,),

            //random
            Container(
              decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/off.gif',height: 30,),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Random Properties',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: (){

                              //view more of the products

                              Navigator.push(context,MaterialPageRoute(builder:(context) => const RandomHouse()));


                            },
                            child: const Text('View More',)
                        )
                      ],
                    ),
                  ),
                  //const ProductsWidget(),
                  const RandomPros(),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            //businesses widget
            Container(
              decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/face.gif',height: 30,),
                        const Text('Businesses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ],
                    ),
                  ),
                  //const ActionCategory(),
                  const Businessess(),
                ],
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }


}



