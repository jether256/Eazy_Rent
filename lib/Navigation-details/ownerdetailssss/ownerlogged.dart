
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/url.dart';
import '../../logged-signup/login.dart';
import '../../providers/busipro.dart';
import '../dashboardnew.dart';
import '../details/housedetails.dart';

class OwnerLogged extends StatefulWidget {


  final String id;
  final String userID;
  final String own;
  final String fon;
  final String biz;
  final String bizphon;
  final String mail;
  final String im1;
  final String im2;
  final String im3;
  final String im4;
  final String im5;
  final String tit;
  final String pr;
  final String desc;
  final String adu;
  final String lat;
  final String lon;
  final String place;
  final String bed;
  final String bath;
  final String fun;
  final String con;
  final String sq;
  final String cs;
  final String flo;
  final String kit;
  final String paid;
  final String start;
  final String end;
  final String blocked;
  final String type;
  final String proid;

  OwnerLogged({ required this.id, required this.userID, required this.own, required this.fon, required this.biz, required this.bizphon, required this.mail, required this.im1, required this.im2, required this.im3, required this.im4, required this.im5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.place, required this.bed, required this.bath, required this.fun, required this.con, required this.sq, required this.cs, required this.flo, required this.kit, required this.paid, required this.start, required this.end, required this.blocked, required this.type, required this.proid});



  @override
  State<OwnerLogged> createState() => _OwnerLoggedState();
}

class _OwnerLoggedState extends State<OwnerLogged> {



  final _formated= NumberFormat();

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
    getPref();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      Provider.of<BusinessProvider>(context,listen: false).getAllHouseDe(widget.userID);

    });


    super.initState();
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







  _callSeller(String s){
    launch(s);
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled){

            return  <Widget>[

              SliverAppBar(
                title: Text(widget.biz,maxLines: 2,),
                flexibleSpace: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Card(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:NetworkImage('https://www.eazyrent256.com/api/owner/mage1/${widget.im1}')
                          ),
                        ),
                        child:Container(
                          color: Colors.grey.withOpacity(0.7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [

                                Text(widget.biz,maxLines:2,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                                Text(widget.mail,maxLines:2,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                                Text(widget.place,maxLines:2,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                                Text(widget.adu,maxLines:2,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),

                                Row(
                                  children: [

                                    Icon(Icons.star,color: Colors.white,),
                                    Icon(Icons.star,color: Colors.white,),
                                    Icon(Icons.star,color: Colors.white,),
                                    Icon(Icons.star_half,color: Colors.white,),
                                    Icon(Icons.star_outline,color: Colors.white,),

                                    SizedBox(width: 4,),
                                    Text('(3.5)',style:TextStyle(color: Colors.white),)

                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(icon:Icon(Icons.phone,color: Colors.lightBlue,), onPressed: () {

                                        launch('tel:${widget.fon}');
                                      } ,),
                                    ),


                                  ],
                                ),

                              ],

                            ),
                          ),
                        ) ,
                      ),
                    ),
                  ),
                ),
                expandedHeight: 250.0,
                pinned: true,
                stretch: true,
                floating: false,
                actions: [

                  ID == null ? IconButton(icon:const Icon(Icons.account_circle_outlined), onPressed: () {

                    Navigator.push(context,MaterialPageRoute(builder:(BuildContext context){
                      return LoginScreen();
                    }));




                  },):IconButton(icon:const Icon(Icons.logout), onPressed: () {


                    lougOut();




                  },),

                  //IconButton(icon:const Icon(Icons.logout), onPressed: () {  },),

                ],
                elevation: 0,
                centerTitle: true,
                backgroundColor:Colors.lightBlue,
              ),

            ];
          },
          body:Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
            child: Container(
              child: Consumer<BusinessProvider>(
                builder: (context,value,child){

                  final pros=value.balo;

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




                    return GridView.builder(
                        itemCount: pros.length,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:2,
                          childAspectRatio: 1/1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder:(context,index){

                          var s_price=int.parse(pros[index].pr);
                          String sprice=_formated.format(s_price);

                          return InkWell(
                            onTap: (){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  HouseDetails(id:pros[index].ID,userID:pros[index].u_id,own:pros[index].own,
                                        fon:pros[index].phon,biz:pros[index].biz,bizphon:pros[index].num,mail:pros[index].mail,
                                        im1:pros[index].img1,im2:pros[index].img2,im3:pros[index].img3,im4:pros[index].img4,im5:pros[index].img5,
                                        tit:pros[index].tit,pr:pros[index].pr,desc:pros[index].desc,adu:pros[index].adu,lat:pros[index].lat,lon:pros[index].lon,
                                        place:pros[index].plac,bed:pros[index].bed,bath:pros[index].bath,fun:pros[index].fun,con:pros[index].con,sq:pros[index].b,cs:pros[index].c,
                                        flo:pros[index].fl,kit:pros[index].kit,paid:pros[index].paid,start:pros[index].start,end:pros[index].end,blocked:pros[index].blo,
                                        type:pros[index].type,proid:pros[index].proi,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child:Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: CachedNetworkImage(
                                      //imageUrl:'https://holomboko.000webhostapp.com/api/assets/images/products/${pros[index].im1}',
                                      imageUrl:'https://${BaseUrl.proImageUrl1}${pros[index].img1}',
                                      //imageUrl:'https://www.etl.co.ug/assets/images/products/${pros[index].im1}',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                      height: 100,
                                    ),
                                  ),

                                  //
                                  // Positioned(
                                  //   top: 0,
                                  //   left: 0,
                                  //   child: IconButton(icon:const Icon(CupertinoIcons.heart_fill,color:Colors.red),
                                  //     onPressed: () {
                                  //
                                  //       //isLoggedIn == false ? please():fav.AddFav(id:pros[index].id, selp:pros[index].selp,regp:pros[index].regp,promoid:pros[index].promoid,context:context);
                                  //     },
                                  //   ),
                                  // ),
                                  //
                                  //
                                  // Positioned(
                                  //   top: 0,
                                  //   right: 0,
                                  //   child: IconButton(icon:Icon(CupertinoIcons.shopping_cart,color:Colors.black,),
                                  //     onPressed: () {
                                  //
                                  //
                                  //       //isLoggedIn == false ?  please():value.CartAdd(id:pros[index].id, selp:pros[index].selp,regp:pros[index].regp,promoid:pros[index].promoid,context:context);
                                  //     },
                                  //   ),
                                  // ),


                                  Positioned(
                                    bottom:2,
                                    left:2,
                                    child:  Text('Shs ${sprice}',maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: TextStyle(color:Colors.black,fontSize: 12,fontWeight: FontWeight.bold
                                    ),),
                                  ),

                                  Positioned(
                                    bottom:16,
                                    left:2,
                                    child:Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Row(
                                          children: [
                                            Icon(Icons.bed,color: Colors.lightBlue,size: 13,),
                                            SizedBox(width: 3,),
                                            Text(pros[index].bed),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Row(
                                          children: [
                                            Icon(Icons.bathtub_outlined,color: Colors.lightBlue,size: 13,),
                                            SizedBox(width: 3,),
                                            Text(pros[index].bed)
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Row(
                                          children: [
                                            Icon(Icons.kitchen,color: Colors.lightBlue,size: 13,),
                                            SizedBox(width: 3,),
                                            Text(pros[index].bed),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    bottom:30,
                                    left:2,
                                    child:Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.location_on,color: Colors.lightBlue,size: 13,),
                                        SizedBox(width: 3,),
                                        Text(pros[index].plac,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    bottom:43,
                                    left: 2,
                                    right: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.0,bottom: 2,top: 2),
                                      child: Text(pros[index].tit,maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: const TextStyle(fontSize:14,fontWeight: FontWeight.bold ),),
                                    ),
                                  ),

                                ],
                              ),
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
      ),
    );
  }
}

