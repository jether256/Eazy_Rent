import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/url.dart';
import '../../providers/busipro.dart';
import 'bizdetail.dart';

class Businessess extends StatefulWidget {
  const Businessess({super.key});

  @override
  State<Businessess> createState() => _BusinessessState();
}

class _BusinessessState extends State<Businessess> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<BusinessProvider>(context,listen: false).getBizne();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      decoration: BoxDecoration(
        //color:Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<BusinessProvider>(
        builder: (context,value,child){

          final cats=value.biz;

          if(value.isLoading){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                  child: Container(
                    width: 120,
                    height: 30,
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
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.grey.shade300
                    ),
                    child:Image.asset('assets/images/lost2.gif',height:20,width: 90,fit: BoxFit.cover,) ,
                  ),
                );


              },);

          }

          return  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:cats.length,
            itemBuilder: (BuildContext context, int index) {

              return  Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                child: Container(
                  //width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      // color:Colors.white10
                    ),
                    child:InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuzinessDetail(
                                ID:cats[index].id,UID:cats[index].user_id,logo:cats[index].logo,shopim:cats[index].shopImage,biznem:cats[index].bizname,phon1:cats[index].phone1,
                                maill:cats[index].email1,tax:cats[index].tax,tin:cats[index].tin,ad:cats[index].ad,lon:cats[index].lon,lat:cats[index].lat,tim:cats[index].time,
                                stat:cats[index].status,ser:cats[index].service,open:cats[index].open,ratin:cats[index].ratin,totRat:cats[index].totora,toppik:cats[index].picked,
                                cret:cats[index].create,paid:cats[index].paid,online:cats[index].onli,cod:cats[index].cod,end:cats[index].end,renu:cats[index].renew,
                                blo:cats[index].blocked
                              ),
                            )
                        );

                      },
                      child: Container(
                        child:Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:'https://${BaseUrl.bizImageUrl}${cats[index].logo}',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ) ,
                            SizedBox(height: 4,),
                            Text(cats[index].bizname,maxLines: 2),
                          ],
                        ),
                      ),
                    )),
              );


            },);

        },
      ),
    );
  }
}
