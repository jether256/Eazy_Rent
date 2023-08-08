import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logged-signup/login.dart';
import '../providers/cat.dart';
import '../providers/categoryproda.dart';
import '../providers/catwithhouse.dart';
import 'catpro/cartproonly.dart';
import 'catpro/catonlyde.dart';

class Kato extends StatefulWidget {
  const Kato({super.key});

  @override
  State<Kato> createState() => _KatoState();
}

class _KatoState extends State<Kato> {

  int? index;
  bool filter = false;

  final _formated= NumberFormat();

  bool isLoggedIn=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkLoginStatus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<CategoryProvider>(context,listen: false).getCategory();
      Provider.of<CategoryProProvider>(context,listen: false);
      //Provider.of<CategoryProvider>(context,listen: false).getAllCategoryDetail(widget.NAME);

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


  List<String> options=['All products','Rentals','Apartments','Bangalows','Hostels','Office Space','Land','Warehouses','Tourist B & B',
    'Shops','Short Stays'

  ];


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


  String _title='Categories';
  String? selctedCat;

  String? selctID;







  @override
  Widget build(BuildContext context) {

    return Consumer<CategoryProProvider>(
      builder: (context,value,child){


        final cats=value.asi;

        int tag=0;


        return Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.lightBlue,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            title:Text(selctedCat == null ? _title:selctedCat!,maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(color: Colors.white)),
            actions: [


            ],


          ),
          backgroundColor:Colors.grey[100],
          body:Column(
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color:Colors.grey[100],
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
                    }
                    else if(value.isNet){

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
                            // width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),

                                color:Colors.white10
                            ),
                            child:Consumer<CategoryProProvider>(
                                builder: (context,value,child){

                                  return ActionChip(
                                    label:Text(cats[index].Nem,maxLines: 2,selectionColor:Colors.deepOrangeAccent,),
                                    onPressed:(){

                                        setState(() {

                                        _title=cats[index].Nem;
                                        selctedCat=cats[index].Nem;
                                        selctID=cats[index].ID;

                                        index = index;
                                        filter = true;
                                      });

                                    value.getCategoHouse(selctedCat!);


                                    },
                                  );

                                }),

                          ),
                        );


                      },);

                  },
                ),
              ),


              filter == false ? Expanded(
                child:CategoryOnly(),
              ):Expanded(
                child: CatOnlyDe(),
              ),
            //:CategoryOnly(),
             // CatOnlyDe(),
            ],
          ),
        );

      },
    );
  }
}
