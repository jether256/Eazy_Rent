import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../api/url.dart';
import '../../providers/fairpro.dart';
import '../../providers/popu.dart';
import '../details/housedetails.dart';

class FairPrice extends StatefulWidget {
  const FairPrice({super.key});

  @override
  State<FairPrice> createState() => _FairPriceState();
}

class _FairPriceState extends State<FairPrice> {

  final _formated= NumberFormat();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<FairProvider>(context,listen: false).getFair();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:270,
      decoration: BoxDecoration(
        color:Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<FairProvider>(
        builder: (context,value,child){

          final pros=value.fair;

          //if loading return a list of loading gifs
          if(value.isLoading){

            return ListView.builder(

                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:Colors.grey.shade300,
                      ),
                      child:Image.asset(
                        'assets/images/hug.gif',
                        height: 235,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                });
          }

          return ListView.builder(
              itemCount: pros.length,
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {


                //var offer=(double.parse(pros[index].regp) - double.parse(pros[index].selp)) /double.parse(pros[index].regp) * 100;

                var s_price=int.parse(pros[index].pr);
                String sprice=_formated.format(s_price);

                // var r_price=int.parse(pros[index].regp);
                // String rprice=_formated.format(r_price);

                return InkWell(
                  onTap: (){



                    //route to product details page with its elements
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8),
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:Colors.grey[100],
                      ),
                      child:Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child:CachedNetworkImage(
                                imageUrl:'https://${BaseUrl.proImageUrl1}${pros[index].img1}',
                                //imageUrl:'https://holomboko.000webhostapp.com/api/assets/images/products/${pros[index].im1}',
                                //imageUrl:'https://www.etl.co.ug/assets/images/products/${pros[index].im1}',
                                height: 180,
                                width: 220,
                                fit: BoxFit.cover,
                              ) ,
                            ),
                          ),
                          //
                          // Positioned(
                          //   top: 12,
                          //   left: 12,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color:Colors.transparent,
                          //         borderRadius: BorderRadius.circular(4)
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(3.0),
                          //       child: Text("${sprice}",style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                          //     ),
                          //   ),
                          // ),
                          //
                          // Positioned(
                          //   top: 12,
                          //   right: 12,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color:Colors.grey.shade300,
                          //         borderRadius: BorderRadius.circular(4)
                          //     ),
                          //     child: const Padding(
                          //       padding: EdgeInsets.all(3.0),
                          //       child: Text("Featured",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                          //     ),
                          //   ),
                          // ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.grey.shade300,
                                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4),bottomRight:Radius.circular(4)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0,right: 4),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      SizedBox(height: 3,),

                                      Text(pros[index].tit,style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),maxLines: 1,overflow:TextOverflow.ellipsis,),

                                      SizedBox(height: 3,),

                                      Row(
                                        children: [
                                          Icon(Icons.location_on,size: 12,color: Colors.lightBlue,),
                                          Text(pros[index].plac,maxLines: 1,overflow:TextOverflow.ellipsis,),
                                        ],
                                      ),
                                      SizedBox(height: 3,),
                                      Text('Shs ${sprice}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                      SizedBox(height: 3,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Row(
                                            children: [
                                              Icon(Icons.bed,color: Colors.lightBlue,size: 16,),
                                              SizedBox(width: 3,),
                                              Text(pros[index].bed),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.bathtub_outlined,color: Colors.lightBlue,size: 16,),
                                              SizedBox(width: 3,),
                                              Text(pros[index].bed)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.kitchen,color: Colors.lightBlue,size: 16,),
                                              SizedBox(width: 3,),
                                              Text(pros[index].bed),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3,),

                                      // RichText(
                                      //   text: TextSpan(
                                      //     children: [
                                      //       TextSpan(
                                      //           text: pros[index].tit,
                                      //           style: TextStyle(color:Colors.black)
                                      //       ),
                                      //       TextSpan(
                                      //           text: " ${pros[index].plac}",
                                      //           style: TextStyle(color: Colors.black)
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      //
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Text(
                                      //       'Shs ${sprice}',
                                      //       style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width:20),
                                      //     Text(
                                      //       'Shs ${sprice}',
                                      //       style: const TextStyle(decoration: TextDecoration.lineThrough
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ) ,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
