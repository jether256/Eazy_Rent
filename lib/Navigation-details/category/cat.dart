
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/url.dart';
import '../../providers/cat.dart';
import 'cartdetails.dart';

class Categoryi extends StatefulWidget {
  const Categoryi({super.key});

  @override
  State<Categoryi> createState() => _CategoryiState();
}

class _CategoryiState extends State<Categoryi> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<CategoryProvider>(context,listen: false).getCategory();
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
      child:Consumer<CategoryProvider>(
        builder: (context,value,child){

          final cats=value.catpros;

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
                              builder: (context) => Categorydeatils(
                                ID:cats[index].ID,NAME:cats[index].Nem,PIC:cats[index].Im,
                              ),
                            )
                        );

                      },
                      child: Container(
                        child:Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:'https://${BaseUrl.catImageUrl}${cats[index].Im}',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ) ,
                            SizedBox(height: 4,),
                            Text(cats[index].Nem,maxLines: 2),
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
