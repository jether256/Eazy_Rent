import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/url.dart';
import '../../providers/cat.dart';
import '../details/housedetails.dart';

class Categorydeatils extends StatefulWidget {
  final String ID;
  final String NAME;
  final String PIC;

  Categorydeatils({ required this.ID, required this.NAME, required this.PIC});

  @override
  State<Categorydeatils> createState() => _CategorydeatilsState();
}

class _CategorydeatilsState extends State<Categorydeatils> {


  final _formated= NumberFormat();

  bool isLoggedIn=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<CategoryProvider>(context,listen: false).getAllCategoryDetail(widget.NAME);


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

                // Navigator.pushReplacementNamed(context, Login.id);
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
    return Scaffold(
      backgroundColor:Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration:   BoxDecoration(
            color:Colors.lightBlue,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title:Text(widget.NAME,maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
        child: Container(
          child: Consumer<CategoryProvider>(
            builder: (context,value,child){

              final pros=value.catall;

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

    );
  }
}
