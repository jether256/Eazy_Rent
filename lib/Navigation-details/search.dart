import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../api/url.dart';
import '../models/housemodel.dart';
import '../providers/ausi.dart';
import 'details/housedetails.dart';

class SearchHouses extends StatefulWidget {
  const SearchHouses({super.key});

  @override
  State<SearchHouses> createState() => _SearchHousesState();
}

class _SearchHousesState extends State<SearchHouses> {


  final _formated= NumberFormat();


  final _sear=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHouse();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       Provider.of<HouseProvider>(context,listen: false).getHouse();
       Provider.of<HouseProvider>(context,listen: false);

    });


  }

  bool isLoading = false;
  bool isNet = false;




  List<HouseModel> _listHouse = [];

  List<HouseModel> pros = [];


  // if (response.statusCode == 200) {
  // setState(() {
  // final data = jsonDecode(response.body);
  // for (Map product in data) {
  // listProduct.add(ProductModel.fromJson(product));
  // }
  // });
  // }


   getHouse() async {


     var response = await http.get(
         Uri.parse(BaseUrl.apiAllHasi),
         headers: {"Accept": "headers/json"});

  if (response.statusCode == 200) {
      setState(() {
      final data = jsonDecode(response.body);
        for (Map product in data) {
          _listHouse.add(HouseModel.fromJson(product));
         }
      });
  }





  }



  searchHouse(String text) {
    pros.clear();
    if (text.isEmpty) {
      setState(() {});
    } else {
      _listHouse.forEach((element) {
        if (element.tit.toLowerCase().contains(text) || element.pr.toLowerCase().contains(text) || element.plac.toLowerCase().contains(text) || element.type.toLowerCase().contains(text) || element.desc.toLowerCase().contains(text) ) {
          pros.add(element);
        }
      });
      setState(() {});
    }
  }






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.grey[100],
        appBar:AppBar(
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
                        child:Container(
                          child:TextField(
                            onChanged:searchHouse,
                            controller:_sear,
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
                        ]
                      ),

                  SizedBox(height: 20,),
                    ],
                  ),

              ),
            ) ,

        ),
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color:Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
          ),
          child:Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
            child:
            _sear.text.isEmpty || pros.length == 0 ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/loo.png',height: 100,width: 100,),
                      Text('There are no properties Your looking for',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                ),
              ),
            ):
             Container(
              child:  ListView.builder(
                physics:BouncingScrollPhysics(),
                itemCount:pros.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){



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
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
                                      child: Text(pros[index].tit,maxLines:2,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize:14,fontWeight: FontWeight.bold ),),
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
                    ),
                  );

                },
              ),
            ),
          ),
          ),
        ),
    );
  }
}
