
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazy_rent/Navigation-details/searchdetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/url.dart';
import '../constants/cola.dart';
import '../logged-signup/login.dart';
import '../providers/searchpro.dart';
import 'details/housedetails.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  final _formKey=GlobalKey<FormState>();
  final _loc=TextEditingController();
  final _bedo=TextEditingController();
  final _typo=TextEditingController();
  final _mini=TextEditingController();
  final _maxi=TextEditingController();

  List num = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];


  List type = [
    'Rentals',
    'Apartments',
    'Bangalows',
    'Hostels',
    'Office Space',
    'Land',
    'Warehouses',
    'Tourist B & B',
    'Short Stays',
    'Shops'

  ];

  List min = [
    '100000',
    '200000',
    '300000',
    '400000',
    '500000',
    '600000',
    '700000',
    '800000',
    '900000',
    '1000000',
    '2000000',
    '3000000',
    '4000000',
    '5000000',
    '6000000',
    '7000000',
    '8000000',
    '9000000',
    '10000000',
    '20000000',
    '30000000',
     ];

  List max = [
    '100000',
    '200000',
    '300000',
    '400000',
    '500000',
    '600000',
    '700000',
    '800000',
    '900000',
    '1000000',
    '2000000',
    '3000000',
    '4000000',
    '5000000',
    '6000000',
    '7000000',
    '8000000',
    '9000000',
    '10000000',
    '20000000',
    '30000000',
  ];

  final _formated= NumberFormat();

  bool isLoggedIn=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkLoginStatus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

     // Provider.of<CategoryProvider>(context,listen: false).getCategory();
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



  @override
  Widget build(BuildContext context) {

    //bedrooms
    showNumBeds(number,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  elevation: 1,
                  backgroundColor: Colors.lightBlue,
                  iconTheme:const IconThemeData(color: Colors.white),
                  title: const Text('Number of bedrooms',style: TextStyle(color: Colors.white),),

                ),


                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount:number.length ,
                      itemBuilder:(BuildContext context,int index){

                        return ListTile(
                          onTap: (){
                            setState(() {
                              _textController.text=number[index];
                            });
                            Navigator.pop(context);

                          },
                          title:Text(number[index]),
                        );

                      }),
                ),

              ],
            ),
          ),
        );
      });
    }

    //type
    showFun(fun,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  elevation: 1,
                  backgroundColor: Colors.blue,
                  iconTheme:const IconThemeData(color: Colors.white),
                  title: const Text('Property Type',style: TextStyle(color: Colors.white),),


                ),

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount:fun.length ,
                      itemBuilder:(BuildContext context,int index){

                        return ListTile(
                          onTap: (){
                            setState(() {
                              _textController.text=fun[index];
                            });
                            Navigator.pop(context);

                          },
                          title:Text(fun[index]),
                        );

                      }),
                ),

              ],
            ),
          ),
        );
      });
    }

    //type
    showMin(fun,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  elevation: 1,
                  backgroundColor: Colors.lightBlue,
                  iconTheme:const IconThemeData(color: Colors.white),
                  title: const Text('Minimum Price',style: TextStyle(color: Colors.white),),


                ),

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount:fun.length ,
                      itemBuilder:(BuildContext context,int index){

                        return ListTile(
                          onTap: (){
                            setState(() {
                              _textController.text=fun[index];
                            });
                            Navigator.pop(context);

                          },
                          title:Text(fun[index]),
                        );

                      }),
                ),

              ],
            ),
          ),
        );
      });
    }

    //type
    showMax(fun,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  elevation: 1,
                  backgroundColor: Colors.lightBlue,
                  iconTheme:const IconThemeData(color: Colors.white),
                  title: const Text('Maximum Price',style: TextStyle(color: Colors.white),),


                ),

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount:fun.length ,
                      itemBuilder:(BuildContext context,int index){

                        return ListTile(
                          onTap: (){
                            setState(() {
                              _textController.text=fun[index];
                            });
                            Navigator.pop(context);

                          },
                          title:Text(fun[index]),
                        );

                      }),
                ),

              ],
            ),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title:Text('Search Properties',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(color: Colors.white)),
        actions: [


        ],

      ),
      backgroundColor:Colors.grey[100],
      body:SingleChildScrollView(
        child: Consumer<SearchProvider>(
          builder: (context,value,child){

            return Form(
              key: _formKey,
              child:Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 8.0,top:20.0),
                child: Container(
                  height:MediaQuery.of(context).size.height,

                  child: Column(
                    children: [
                      TextFormField(
                          controller:_loc,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              labelText: 'Location',
                              hintText: 'Location',
                              border: OutlineInputBorder()
                          ),

                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter location';

                            }
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){

                          showNumBeds(num,_bedo);
                        },
                        child: TextFormField(
                          controller: _bedo,
                          enabled: false,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.bed,color: Colors.lightBlue,),
                            labelText: 'BedRooms',
                            hintText: 'Bedrooms',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Please enter number of bedrooms';
                            }

                            return null;

                          },
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                        onTap: (){

                          showFun(type,_typo);
                        },
                        child: TextFormField(
                          controller: _typo,
                          enabled: false,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.house,color: Colors.lightBlue,),
                            labelText: 'Property Type',
                            hintText: 'Property Type',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Please enter property type';
                            }

                            return null;

                          },
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                        onTap: (){

                          showMin(min,_mini);
                        },
                        child: TextFormField(
                          controller: _mini,
                          enabled: false,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money,color: Colors.lightBlue,),
                            labelText: 'Minimum Price',
                            hintText: 'Minimum Price',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Enter minimum price';
                            }

                            return null;

                          },
                        ),
                      ),


                      const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                        onTap: (){

                          showMax(max,_maxi);
                        },
                        child: TextFormField(
                          controller: _maxi,
                          enabled: false,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money,color: Colors.lightBlue,),
                            labelText: 'Maximum price',
                            hintText: 'Maximum Price',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Please enter maximum price';
                            }

                            return null;

                          },
                        ),
                      ),




                      Consumer<SearchProvider>(
                          builder: (context, results, child) {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {

                              //Provider.of<UserProvider>(context,listen: false).registerUser(email:_ema.text, password:_pass.text, firstName:f, lastName: lastName, address: address, phone: phone, country: country);
                            });
                            return Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                                onPressed: (){


                                  if(_formKey.currentState!.validate()){

                                    //continue if the textfields are not empty

                                    if (
                                    _loc.text !=''||
                                        _bedo.text !='' ||
                                        _typo.text !='' ||
                                        _mini.text !='' ||
                                        _maxi.text !=''
                                    ) {


                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  SearchDe(location: _loc.text, bed: _bedo.text, type: _typo.text, mini: _mini.text, maxi: _maxi.text,)));

                                      //post edittext data to login function from the UserProvider
                                      // results.getAllSearch(
                                      //     location: _loc.text,
                                      //     bed: _bedo.text,
                                      //     type: _typo.text,
                                      //     mini: _mini.text,
                                      //     maxi: _maxi.text,
                                      //     context: context);

                                      //set text fields to empty after
                                      _loc.text =='';
                                      _bedo.text =='';
                                      _typo.text =='';
                                      _mini.text =='';
                                      _maxi.text =='';


                                    }


                                  }

                                }, child:const Text('Search',style: TextStyle(color: Colors.white),),
                              ),
                            );

                          }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}
