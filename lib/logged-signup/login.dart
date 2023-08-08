
import 'package:eazy_rent/logged-signup/sign.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';

import 'checkmail.dart';

class LoginScreen extends StatefulWidget {

  static const  String id='login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _formKey=GlobalKey<FormState>();
  final _ema=TextEditingController();
  final _pass=TextEditingController();



  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  // login() async {
  //
  //   var response=await http.post(Uri.parse('https://eazyrent256.com/api/user/login.php'),
  //
  //       body:{"email":encryp(_ema.text),"password":encryp(_pass.text),});
  //
  //
  //   setState(() async {
  //
  //     EasyLoading.show(status: 'Logging in .....');
  //
  //
  //     if(response.statusCode==200){
  //       var userData=json.decode(response.body);
  //
  //       String ID=userData['id'];
  //       String name=userData['name'];
  //       String email=userData['email'];
  //       String pass=userData['password'];
  //       String pic=userData['pic'];
  //       String num=userData['phone'];
  //       String log=userData['last_log'];
  //       String create=userData['create_date'];
  //       String ad=userData['addr'];
  //       String lat=userData['lat'];
  //       String lon=userData['lon'];
  //       String token=userData['token'];
  //       String type=userData['type'];
  //       String status=userData['status'];
  //       String renew=userData['renew_date'];
  //       String fcm=userData['fcmid'];
  //
  //
  //       if(userData=="ERROR"){
  //
  //
  //         EasyLoading.showError('Login Failed..');
  //
  //
  //         // showDialog(
  //         //   context: (context),
  //         //   builder:(context)=> AlertDialog(
  //         //     shape:Border.all(color: Colors.grey),
  //         //     backgroundColor: Colors.red,
  //         //     title:const Text('Message',style: TextStyle(color: Colors.white),),
  //         //     content:const Text('Logged In Failed',style: TextStyle(color: Colors.white),) ,
  //         //     actions:<Widget> [
  //         //       ElevatedButton(
  //         //         style: ButtonStyle(
  //         //           backgroundColor:MaterialStateProperty.all(Colors.lightGreen ),
  //         //         ),
  //         //         onPressed:(){
  //         //           Navigator.pop(context);
  //         //         },
  //         //         child: const Text('Cancel',style: TextStyle(color: Colors.white),),),
  //         //
  //         //     ],
  //         //   ),
  //         // );
  //
  //
  //
  //       }else{
  //
  //
  //
  //
  //         if(userData['type']=='user' || userData['type']=='owner'){
  //
  //           savePref(ID, name, email, num, pass, pic, lon, lat, ad, token, renew, status, type, log, create,fcm).then((value){
  //
  //             Navigator.pushReplacementNamed(context, DashBoard.id);
  //           });
  //           EasyLoading.showSuccess(' Logged In...');
  //
  //           // showDialog(
  //           //   context: (context),
  //           //   builder:(context)=> AlertDialog(
  //           //     shape:Border.all(color: Colors.grey),
  //           //     backgroundColor: Colors.purple,
  //           //     title:const Text('Message',style: TextStyle(color: Colors.white),),
  //           //     content:const Text('Logged In Successfully',style: TextStyle(color: Colors.white),) ,
  //           //     actions:<Widget> [
  //           //       ElevatedButton(
  //           //         style: ButtonStyle(
  //           //           backgroundColor:MaterialStateProperty.all(Colors.lightGreen ),
  //           //         ),
  //           //         onPressed:(){
  //           //           Navigator.pop(context);
  //           //         },
  //           //         child: const Text('Cancel',style: TextStyle(color: Colors.white),),),
  //           //
  //           //     ],
  //           //   ),
  //           // );
  //
  //         }
  //
  //         print(userData);
  //       }
  //
  //     }
  //
  //
  //
  //   });
  //
  //
  //
  //
  //
  //
  // }
  //
  //
  //
  //
  //
  // String? userID,name,email,num, pass, pic,lon, lat,ad, token,renew,status,type,log,create,cry,uup,fcmi;
  // getPref() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     userID = sharedPreferences.getString(PrefInfo.ID);
  //     name = sharedPreferences.getString(PrefInfo.name);
  //     email = sharedPreferences.getString(PrefInfo.email);
  //     num = sharedPreferences.getString(PrefInfo.num);
  //     pass = sharedPreferences.getString(PrefInfo.pass);
  //     pic = sharedPreferences.getString(PrefInfo.pic);
  //     lon = sharedPreferences.getString(PrefInfo.lon);
  //     lat = sharedPreferences.getString(PrefInfo.lat);
  //     ad = sharedPreferences.getString(PrefInfo.ad);
  //     token = sharedPreferences.getString(PrefInfo.token);
  //     renew = sharedPreferences.getString(PrefInfo.renew);
  //     status = sharedPreferences.getString(PrefInfo.status);
  //     type = sharedPreferences.getString(PrefInfo.type);
  //     log = sharedPreferences.getString(PrefInfo.log);
  //     create = sharedPreferences.getString(PrefInfo.create);
  //     fcmi = sharedPreferences.getString(PrefInfo.fcm);
  //   });
  // }
  //
  //
  //
  // savePref(
  //     String ID ,String name,String email, String num,String pass,String pic ,String lon,String lat,
  //     String ad,String token,String renew,String status ,String type, String log,String create,String fcm
  //     ) async{
  //   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     sharedPreferences.setString(PrefInfo.ID, ID);
  //     sharedPreferences.setString(PrefInfo.name, name);
  //     sharedPreferences.setString(PrefInfo.email,email);
  //     sharedPreferences.setString(PrefInfo.num,num);
  //     sharedPreferences.setString(PrefInfo.pass, pass);
  //     sharedPreferences.setString(PrefInfo.pic, pic);
  //     sharedPreferences.setString(PrefInfo.lon, lon);
  //     sharedPreferences.setString(PrefInfo.lat, lat);
  //     sharedPreferences.setString(PrefInfo.ad,ad);
  //     sharedPreferences.setString(PrefInfo.token, token);
  //     sharedPreferences.setString(PrefInfo.renew, renew);
  //     sharedPreferences.setString(PrefInfo.status, status);
  //     sharedPreferences.setString(PrefInfo.type, type);
  //     sharedPreferences.setString(PrefInfo.log, log);
  //     sharedPreferences.setString(PrefInfo.create, create);
  //     sharedPreferences.setString(PrefInfo.fcm, fcm);
  //   });
  //
  // }



  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return WillPopScope(
      child: Scaffold(
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
                    child: Center(child: Text('LOGIN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
                  ),



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


                  //email textfield
                  TextFormField(
                      controller: _ema,
                      cursorColor: Colors.blue.shade200,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon:Icon(Icons.email,size: 18,color:Colors.grey,),
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


                  //password textfiled
                  TextFormField(
                      controller: _pass,
                      cursorColor: Colors.blue.shade200,
                      obscureText: _secureText,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock,size: 18,color:Colors.grey,),
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

                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){

                          //Navigator.pushReplacementNamed(context,CheckMail.id);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckMail()));


                          //EasyLoading.showSuccess('Forgot password clicked.....');

                        },
                        child:  Text('Forgot password?',style: TextStyle(color: Colors.blue),
                        ),
                      )),

                  const SizedBox(height: 20,),

                  Consumer<UserProvider>(
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

                                //continue if the textfields are not empty
                                if (
                                _ema.text !=''||
                                    _pass.text !=''
                                ) {


                                  //post edittext data to login function from the UserProvider
                                  auth.loginUser(
                                      email: _ema.text,
                                      password: _pass.text,
                                      context: context);

                                  //set text fields to empty after
                                  _ema.text =='';
                                  _pass.text =='';


                                }


                              }

                            }, child:const Text('Login',style: TextStyle(color: Colors.white),),
                          ),
                        );
                      }),

                  const SizedBox(height: 20,),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){

                          //EasyLoading.showSuccess('Sign Up Clicked...');
                          Navigator.pushReplacementNamed(context, SignUpScreen.id);

                        },
                        child:   Text('Dont have an account? ${'Sign Up'}',style: TextStyle(color: Colors.blue),
                        ),
                      )),

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
