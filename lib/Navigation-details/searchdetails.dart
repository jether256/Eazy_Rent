import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../api/url.dart';
import '../providers/searchpro.dart';
import 'details/housedetails.dart';

class SearchDe extends StatefulWidget {

  final String location;
  final String bed;
  final String type;
  final String mini;
  final String maxi;

  const SearchDe({required this.location, required this.bed, required this.type, required this.mini, required this.maxi});

  @override
  State<SearchDe> createState() => _SearchDeState();
}

class _SearchDeState extends State<SearchDe> {

  final _formated= NumberFormat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<SearchProvider>(context,listen: false).getAllSearch(location:widget.location, bed:widget.bed, type:widget.type, mini:widget.mini, maxi: widget.maxi, context: context);


    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title:Text('Search Results',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(color: Colors.white)),
        actions: [

        ],

      ),
      backgroundColor:Colors.grey[100],
      body:Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child:Consumer<SearchProvider>(
              builder: (context,value,child){

                final pros=value.sir;

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

                }else if(value.isNet){

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
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Image.asset('assets/images/lost2.gif'),
                        );



                      }
                  );

                }

                else{




                  return ListView.builder(
                      itemCount: pros.length,

                      itemBuilder:(context,index){

                        int k=0;
                        int z=k+pros.length;

                        var s_price=int.parse(pros[index].pr);
                        String sprice=_formated.format(s_price);

                        return pros[index].ID== "0" ? Container(
                          child: const Center(child: Text('Does not have a category..',style:TextStyle(fontSize: 18),)),
                        ):InkWell(
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
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CachedNetworkImage(
                                    //imageUrl:'https://holomboko.000webhostapp.com/api/assets/images/products/${pros[index].im1}',
                                    imageUrl:'https://${BaseUrl.proImageUrl1}${pros[index].img1}',
                                    //imageUrl:'https://www.etl.co.ug/assets/images/products/${pros[index].im1}',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    height: 150,
                                  ),
                                ),


                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(left: 2.0,bottom: 2,top: 2),
                                          child: Text(pros[index].tit,maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
                                        ),

                                        SizedBox(height: 4,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on,color: Colors.lightBlue,size: 13,),
                                            SizedBox(width: 3,),
                                            Text(pros[index].plac,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14),),
                                          ],
                                        ),

                                        SizedBox(height: 4,),

                                        Text('Shs ${sprice}',maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: TextStyle(color:Colors.black,fontSize: 14,fontWeight: FontWeight.bold
                                        ),),
                                        SizedBox(height: 4,),

                                        Row(
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

                                        SizedBox(height: 8,),


                                      ],
                                    ),
                                  ),
                                )




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
    );
  }
}
