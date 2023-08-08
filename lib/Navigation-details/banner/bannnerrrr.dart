import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:eazy_rent/providers/banapro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/url.dart';

import '../businesses/bizetailsbanner.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  @override
  void initState() {
    super.initState();
    //getPref();
    //_checkLoginStatus();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BanaProvider>(context,listen: false).getAllBanas();

    });


  }

  int _index= 0;
  int _dataLenghth=1;


  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        //color:Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<BanaProvider>(
        builder: (context,value,child){

          final cats=value.bana;

          if(value.isLoading){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                  child: Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.grey.shade300
                    ),
                    child:Image.asset('assets/images/hug.gif',height:20,width: 90,) ,
                  ),
                );


              },);

          }else if(value.isNet){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                  child: Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.grey.shade300
                    ),
                    child:Image.asset('assets/images/lost2.gif',height:20,width: 90,fit: BoxFit.cover,) ,
                  ),
                );


              },);

          }

          return   CarouselSlider.builder(
            itemCount:cats.length,
            options:CarouselOptions(
                initialPage: 0,
                autoPlay: true,height: 150,
                onPageChanged:(int i, carouselPageChangedReason){

                  // setState(() {
                  //   _index=i;
                  // });

                }
            ),
            itemBuilder: (BuildContext context, int index,int realIndex) {

              return  Padding(
                padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 5),
                child: Container(
                  //width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      // color:Colors.white10
                    ),
                    child:InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuzDetailsBanner(
                                id:cats[index].id,User_id:cats[index].user_id,biz:cats[index].bizname,
                                tit:cats[index].tit,image:cats[index].im,
                                start:cats[index].start,end:cats[index].end,paid:cats[index].paid,
                              ),
                            )
                        );




                      },
                      child:Container(
                          width: MediaQuery.of(context).size.width,
                          ///height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),

                              color: Colors.white10
                          ),
                          child: CachedNetworkImage(imageUrl:'https://${BaseUrl.banaIm}${cats[index].im}',fit: BoxFit.fill,
                            height: 150,
                          )),

                    )),
              );


            },);

        },
      ),
    );
  }
}
