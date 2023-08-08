import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {

  final _formKey = GlobalKey<FormState>();

  final _ema = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<UserProvider>(context,listen: false);

    });


  }



  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop:() async{

          return false;
        },
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
                      child: Center(child: Text('Check Mail',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
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

                    Consumer<UserProvider>(
                        builder: (context, auth, child) {

                          return Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              onPressed: (){


                                if(_formKey.currentState!.validate()){

                                  //continue if the textfields are not empty
                                  if (
                                  _ema.text !='') {

                                    //post edittext data to login function from the UserProvider
                                    auth.sendMail(
                                        email: _ema.text,
                                        context: context);

                                  }


                                }

                              }, child:const Text('Send',style: TextStyle(color: Colors.white),),
                            ),
                          );

                        }),



                    const SizedBox(height: 50,),
                  ],
                ),
              )
          ),
        )
    );
  }
}
