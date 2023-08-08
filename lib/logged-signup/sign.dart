import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import '../../../crypt/encrypt.dart';

import '../api/url.dart';
import '../providers/userprovider.dart';
import 'login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SignUpScreen extends StatefulWidget {

  static const  String id='sign';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey=GlobalKey<FormState>();

  final _name=TextEditingController();
  final _num=TextEditingController();
  final _ema=TextEditingController();
  final _pass=TextEditingController();
  final _address=TextEditingController();
  final _lon=TextEditingController();
  final _lat=TextEditingController();



  bool verifyButton=false;

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }


  _scaffold(message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
      action: SnackBarAction(label: 'Ok',onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
  }



  register() async {
    // controllers should not be empty to avoid send null values to the database
    if(
    _name.text!='' && _num.text !='' &&
    _ema.text!=''&& _pass.text!=''){

      var response = await http.post(
          Uri.parse(
              BaseUrl.apiRegister),

          //headers can be left out since CORS doesn't affect apps but it will affect A flutter web app,
          //so just to be safe include them.
          headers: {"Accept": "headers/json"},
          body: {
            "name": encryp(_name.text),
            "phone": encryp(_num.text),
            "email": encryp(_ema.text),
            "password": encryp(_pass.text),

          });

      setState(() async {

        //EasyLoading.show(status: 'Saving .....');

        if (response.statusCode == 200) {

          // decode json data passed in the http body
          var userData = json.decode(
              response.body);

          if (userData == "ERROR") {

            //choose another email.This one already exists
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Email already exists"),
                  backgroundColor: Colors.red.withOpacity(0.9),
                  elevation: 10, //shadow
                )
            );


          }else {

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Succesfully registered"),
                  backgroundColor: Colors.green.withOpacity(0.9),
                  elevation: 10, //shadow
                )
            );

            ///verify otp code sent
            Navigator.pushNamed(context,LoginScreen.id);

            print(userData);
          }
        }


      });

    }


  }




  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;



    return WillPopScope(
      child:Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor:Colors.white,
        body: SafeArea(
            child:Form(
              key: _formKey,
              child: ListView(
                padding:const EdgeInsets.only(left: 10,right: 10),
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0,bottom: 30),
                    child: Center(child: Text('REGISTER',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
                  ),

                  // Center(
                  //   child: AnimatedTextKit(
                  //     animatedTexts: [
                  //       ColorizeAnimatedText(
                  //         'LOGIN',
                  //         textStyle:colorizeTextStyle,
                  //         colors:colorizeColors,
                  //       ),
                  //     ],
                  //
                  //   ),
                  // ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),

                      Image.asset('assets/images/loo.png',width: 115),

                      const SizedBox(height: 30,),
                    ],
                  ),


                  //first name
                  TextFormField(
                      controller: _name,
                      cursorColor: Colors.blue.shade200,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          prefixIcon:Icon(Icons.person,size: 18,color:Colors.grey,),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.blue),
                          )
                      ),

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your Name';

                        }
                        return null;
                      }

                  ),


                  const SizedBox(height: 10,),

                  //phone number
                  TextFormField(
                      controller: _num,
                      cursorColor: Colors.blue.shade200,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone,size: 18,color:Colors.grey,),
                          filled: true,
                          fillColor:Colors.grey.shade200,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.blue),
                          )
                      ),

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your Phone Number';

                        }
                        return null;
                      }

                  ),

                  const SizedBox(height: 10,),


                  //email
                  TextFormField(
                      controller: _ema,
                      cursorColor: Colors.blue.shade200,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email,size: 18,color:Colors.grey,),
                          filled: true,
                          fillColor:Colors.grey.shade200,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.blue),
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty){

                          return 'Enter Email';
                        }
                        bool _isValid= (EmailValidator.validate(value));
                        if(_isValid==false){
                          return 'Enter Valid Email Address';

                        }
                        return null;

                      }
                  ),

                  const SizedBox(height: 10,),

                  //password
                  TextFormField(
                      controller: _pass,
                      cursorColor: Colors.blue.shade200,
                      obscureText: _secureText,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon:Icon(Icons.lock,size: 18,color:Colors.grey,),
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: _secureText
                                ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            )
                                : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          filled: true,
                          fillColor:Colors.grey.shade200,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.blue),
                          )
                      ),

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your Password';

                        }
                        return null;
                      }

                  ),

                  const SizedBox(height: 10,),


                  //sign up
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20,right: 20),
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  //     onPressed: (){
                  //
                  //
                  //
                  //       if(_formKey.currentState!.validate()){
                  //
                  //         register();
                  //
                  //       }
                  //
                  //     }, child:const Text('Sign Up',style: TextStyle(color: Colors.white),),
                  //   ),
                  // ),



                  //sign up
                  Consumer<UserProvider>(
                      builder: (context, auth, child) {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {

                          //Provider.of<UserProvider>(context,listen: false).registerUser(email:_ema.text, password:_pass.text, firstName:f, lastName: lastName, address: address, phone: phone, country: country);
                        });
                        return  Consumer<UserProvider>(
                            builder: (context, auth, child) {
                              WidgetsBinding.instance!.addPostFrameCallback((_) {

                                //Provider.of<UserProvider>(context,listen: false).registerUser(email:_ema.text, password:_pass.text, firstName:f, lastName: lastName, address: address, phone: phone, country: country);
                              });
                              return Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  onPressed: (){



                                    if(_formKey.currentState!.validate()){

                                      register();

                                      //
                                      // if (_name.text !='' ||
                                      //     _ema.text !=''||
                                      //     _pass.text !=''||
                                      //     _num.text !='') {
                                      //
                                      //
                                      //   //post edittext data to register function from the UserProvider
                                      //   //post edittext data to register function from the UserProvider
                                      //   auth.registerUser(
                                      //       name: _name.text,
                                      //       num: _num.text,
                                      //       email: _ema.text,
                                      //       password: _pass.text,
                                      //       context: context);
                                      //
                                      //   //set text fields to empty after
                                      //   _name.text =='' ;
                                      //   _num.text =='' ;
                                      //   _ema.text =='';
                                      //   _pass.text =='';
                                      //
                                      // }
                                    }

                                  }, child:const Text('Sign Up',style: TextStyle(color: Colors.white),),
                                ),
                              );
                            });
                      }),

                  const SizedBox(height: 10,),


                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: (){

                        Navigator.pushNamed(context, LoginScreen.id);

                      }, child:const Text('Already have account? Login',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  //


                  const SizedBox(height: 50,),
                ],
              ),
            )
        ),
      ),
      onWillPop:() async{

        return false;
      },
    );
  }
}
