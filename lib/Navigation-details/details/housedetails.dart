
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazy_rent/logged-signup/login.dart';
import 'package:eazy_rent/Navigation-details/details/report.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import '../../api/url.dart';

import '../ownerdetailssss/ownerlogged.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HouseDetails extends StatefulWidget {
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

  HouseDetails({ required this.id, required this.userID, required this.own, required this.fon, required this.biz, required this.bizphon, required this.mail, required this.im1, required this.im2, required this.im3, required this.im4, required this.im5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.place, required this.bed, required this.bath, required this.fun, required this.con, required this.sq, required this.cs, required this.flo, required this.kit, required this.paid, required this.start, required this.end, required this.blocked, required this.type, required this.proid});


  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {


  PageController productImageSlider = PageController();

  final _formated= NumberFormat();

  int _qty=1;


  bool isLoggedIn=false;






  @override
  void initState() {

   //getPref();
    //late List photos;
_checkLoginStatus();

    super.initState();
  }
  // String? userID,name,email,num, pass, pic,lon, lat,ad, token,renew,status,type,log,create,cry,uup,fcmi;
  // getPref() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     userID = sharedPreferences.getString(PrefInfo.ID);
  //     name = sharedPreferences.getString(PrefInfo.name);
  //     email = sharedPreferences.getString(PrefInfo.email);
  //     num = sharedPreferences.getString(PrefInfo.num);
  //     pass = sharedPreferences.getString(PrefInfo.pass);
  //     pic = sharedPreferences.getString(PrefInfo.pic);
  //     lon = sharedPreferences.getString(PrefInfo.lon);
  //     lat = sharedPreferences.getString(PrefInfo.lat);
  //     ad = sharedPreferences.getString(PrefInfo.ad);
  //     token = sharedPreferences.getString(PrefInfo.token);
  //     renew = sharedPreferences.getString(PrefInfo.renew);
  //     status = sharedPreferences.getString(PrefInfo.status);
  //     type = sharedPreferences.getString(PrefInfo.type);
  //     log = sharedPreferences.getString(PrefInfo.log);
  //     create = sharedPreferences.getString(PrefInfo.create);
  //     fcmi = sharedPreferences.getString(PrefInfo.fcm);
  //   });
  // }


  late List photos=[

    'https://${BaseUrl.proImageUrl1}${widget.im1}',
    'https://${BaseUrl.proImageUrl2}${widget.im2}',
    'https://${BaseUrl.proImageUrl3}${widget.im3}',
    'https://${BaseUrl.proImageUrl4}${widget.im4}',
    'https://${BaseUrl.proImageUrl5}${widget.im5}',

  ];


  _checkLoginStatus() async {
    SharedPreferences localStorage= await SharedPreferences.getInstance();
    var Id=localStorage.getString('cust_id');

    if(Id != null){

      setState(() {
        isLoggedIn=true;
      });

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
              Image.asset('assets/images/logo.png',height: 50,width: 50,)
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



  _callSeller(String s){
    launch(s);
  }


  _scaffold(message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
      action: SnackBarAction(label: 'ok',onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
  }



  @override
  Widget build(BuildContext context) {

    var _price=int.parse(widget.pr);
    String price=_formated.format(_price);



    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          //leading: IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
          //leading: Image.asset("assets/images/logo.png",color: Colors.white,),
          title: Text(widget.tit,style: const TextStyle(color: Colors.white),),
          // actions: [
          //   IconButton(icon:const Icon(Icons.login), onPressed: () {
          //
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => LoginScreen(),
          //         )
          //     );
          //
          //   },),
          //   //IconButton(icon:const Icon(Icons.logout), onPressed: () {  },),
          //   IconButton(icon:const Icon(Icons.notifications), onPressed: () {  },),
          // ],
          elevation: 2,
          centerTitle: true,
          backgroundColor:Colors.lightBlue,
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
          // ),
          //flexibleSpace: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
        ),
        body:ListView(
          padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 70),
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade200,
              ),

              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // product image
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.white,
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      controller: productImageSlider,
                      children: List.generate(
                        photos.length,
                            (index) => ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover, imageUrl: photos[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // appbar
                  // indicator
                  Positioned(
                    bottom: 16,
                    child: SmoothPageIndicator(
                      controller: productImageSlider,
                      count: photos.length,
                      effect: ExpandingDotsEffect(
                        dotColor:Colors.lightBlue.withOpacity(0.2),
                        activeDotColor:Colors.lightBlue.withOpacity(0.2),
                        dotHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),),

            const SizedBox(
              height: 20,
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.tit.toUpperCase(),maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,size: 14,color: Colors.lightBlue,),
                      SizedBox(width: 4,),
                      Text(widget.place,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,),),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Text('\Shs $price',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

                  //desc
                  const SizedBox(height: 10,),

                  const Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  const SizedBox(height: 10,),
                  const Divider(color: Colors.grey,thickness: 3,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                               // Text(widget.desc),

                                ExpandableText(
                                  widget.desc,
                                  expandText: 'View More',
                                  collapseText: 'View Less',
                                  maxLines: 2,
                                  style: const TextStyle(color:Colors.black),
                                ),
                                const SizedBox(height: 10,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.bed,size: 14,color: Colors.lightBlue,),
                                              SizedBox(width: 4,),
                                              Text('BedRooms: ${widget.bed}'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.bathtub_outlined,size: 14,color: Colors.lightBlue,),
                                              SizedBox(width: 4,),
                                              Text('Bathrooms: ${widget.bath}'),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.apartment,size: 14,color: Colors.lightBlue,),
                                              SizedBox(width: 4,),
                                              Text('Total Floors: ${widget.flo}'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.kitchen,size: 14,color: Colors.lightBlue,),
                                              SizedBox(width: 4,),
                                              Text('Kitchen: ${widget.kit}'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 4,),
                                      Text('Furnishing: ${widget.fun}'),
                                      const SizedBox(height: 4,),
                                      Text('Construction status: ${widget.con}'),
                                      const SizedBox(height: 4,),
                                      Text('Building Sqft: ${widget.sq}'),
                                      const SizedBox(height: 4,),
                                      Text('Floor Sqft: ${widget.cs}'),
                                    ],
                                  ),
                                const SizedBox(height: 20,),
                                Text('Posted at: ${widget.start}'),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(color: Colors.grey,),

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.shade300,
                          radius: 38,
                          child: Icon(CupertinoIcons.person_alt,
                            size: 60,
                            color: Colors.red.shade300,),
                        ),

                      ),
                      const SizedBox(height: 10,),

                      Expanded(
                        child: ListTile(
                          title: Text(widget.own,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: const Text('See Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          trailing: IconButton(icon:const Icon(Icons.arrow_forward_ios,size: 12,), onPressed: () {


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  OwnerLogged(id:widget.id,userID:widget.userID,own:widget.own,
                                      fon:widget.fon,biz:widget.biz,bizphon:widget.bizphon,mail:widget.mail,
                                      im1:widget.im1,im2:widget.im2,im3:widget.im3,im4:widget.im4,im5:widget.im5,
                                      tit:widget.tit,pr:widget.pr,desc:widget.desc,adu:widget.adu,lat:widget.lat,lon:widget.lon,
                                      place:widget.place,bed:widget.bed,bath:widget.bath,fun:widget.fun,con:widget.con,sq:widget.sq,cs:widget.cs,
                                      flo:widget.flo,kit:widget.kit,paid:widget.paid,start:widget.start,end:widget.end,blocked:widget.blocked,
                                      type:widget.type,proid:widget.proid,
                                    )));


                          },),
                        ),
                      )
                    ],

                  ),

                  const SizedBox(height: 8,),
                  const Text('Location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  const SizedBox(height: 10,),


                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: Text('HOUSE ID:  ${widget.proid}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),

                      TextButton(
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Report(id:widget.id,userID:widget.userID,own:widget.own,
                                    fon:widget.fon,biz:widget.biz,bizphon:widget.bizphon,mail:widget.mail,
                                    im1:widget.im1,im2:widget.im2,im3:widget.im3,im4:widget.im4,im5:widget.im5,
                                    tit:widget.tit,pr:widget.pr,desc:widget.desc,adu:widget.adu,lat:widget.lat,lon:widget.lon,
                                    place:widget.place,bed:widget.bed,bath:widget.bath,fun:widget.fun,con:widget.con,sq:widget.sq,cs:widget.cs,
                                    flo:widget.flo,kit:widget.kit,paid:widget.paid,start:widget.start,end:widget.end,blocked:widget.blocked,
                                    type:widget.type,proid:widget.proid,
                                  )));


                        },
                        child: const Text('REPORT ',style: TextStyle(color: Colors.blue),
                        ),),
                    ],
                  ),
                ],

              ),
            )

          ],
        ),
        bottomSheet:Row(
          children: [
            Expanded(
                child:Container(
                  child: Row(
                    children: [

                       Expanded(

                           child:Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                             child: InkWell(
                               onTap: (){


                                 openWhatsapp();

                                 ///_roomProvider.selectedChat(_chatroomId);

                                 //_roomDetails.getselectedChart(widget.own, widget.userID,widget.proid,widget.im1,widget.tit);

                                 // Navigator.push(
                                 //     context,
                                 //     MaterialPageRoute(
                                 //         builder: (context) =>  ChatDetails(id:widget.id,userID:widget.userID,own:widget.own,
                                 //           fon:widget.fon,biz:widget.biz,bizphon:widget.bizphon,mail:widget.mail,
                                 //           im1:widget.im1,im2:widget.im2,im3:widget.im3,im4:widget.im4,im5:widget.im5,
                                 //           tit:widget.tit,pr:widget.pr,desc:widget.desc,adu:widget.adu,lat:widget.lat,lon:widget.lon,
                                 //           place:widget.place,bed:widget.bed,bath:widget.bath,fun:widget.fun,con:widget.con,sq:widget.sq,cs:widget.cs,
                                 //           flo:widget.flo,kit:widget.kit,paid:widget.paid,start:widget.start,end:widget.end,blocked:widget.blocked,
                                 //           type:widget.type,proid:widget.proid,
                                 //         )));


                                 // Navigator.push(
                                 //     context,
                                 //     MaterialPageRoute(
                                 //         builder: (context) =>  ChatDetails(chatID:_chatroomId,
                                 //
                                 //         )));

                               },
                               child: Container(
                                 height:56 ,
                                 decoration: BoxDecoration(
                                   color:Colors.lightBlue,
                                   borderRadius: BorderRadius.circular(4),

                                 ),
                                 child: Center(child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisSize: MainAxisSize.min,
                                     children:[
                                       Image.asset('assets/images/whatsapp.png',height: 40,),
                                      // Text('Message',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                     ],
                                   ),
                                 ),
                                 ),
                               ),
                             ),
                           ),
                       ),


                      Expanded(
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                            child: InkWell(
                              onTap: (){


                                launch('tel:${widget.fon}');

                              },
                              child: Container(
                                height:56 ,
                                decoration: BoxDecoration(
                                  color:Colors.black54,
                                  borderRadius: BorderRadius.circular(4),

                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(CupertinoIcons.phone,color: Colors.white,),
                                      Text('Call',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                ),
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  openWhatsapp() async {

    String whatsapp = '+256${widget.fon}';
    String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=Hey! I'm inquiring about the ${widget.tit} ID ${widget.proid} at ${widget.place}";
    String whatsappURLIos =
        "https://wa.me/$whatsapp?text=${Uri.parse("Hey! I'm inquiring about the ${widget.tit} ID ${widget.proid} at ${widget.place} ")}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        _scaffold("Whatsapp not installed");
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        _scaffold("Whatsapp not installed");
      }
    }
  }
}
