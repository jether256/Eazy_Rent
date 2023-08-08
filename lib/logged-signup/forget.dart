import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';


class ForgotPassword extends StatefulWidget {


  final String mail;

  ForgotPassword({required this.mail});


  static const  String id='fogot';


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();

  final _pass = TextEditingController();
  final _pass2 = TextEditingController();
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
                    child: Center(child: Text('RESET PASSWORD',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
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


                  //sapozd to enter email only

                  //password textfield
                  TextFormField(
                      controller: _pass,
                      cursorColor: Colors.blue.shade200,
                      decoration: InputDecoration(
                          hintText: 'New Password',
                          prefixIcon: Icon(Icons.lock,size: 18,color: Colors.grey,),
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


                  const SizedBox(height: 20,),

                  Consumer<UserProvider>(
                      builder: (context, auth, child) {

                        return Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: (){


                              if(_formKey.currentState!.validate()){

                                //continue if the textfields are not empty
                                if (_pass.text !='') {


                                  //post edittext data to login function from the UserProvider
                                  auth.passReset(
                                      password: _pass.text,
                                      email:widget.mail,
                                      context: context);


                                  //
                                  // auth.passReset(password: _pass.text, context: context);

                                  //set text fields to empty after
                                  _pass.text =='';


                                }


                              }

                            }, child:const Text('Reset',style: TextStyle(color: Colors.white),),
                          ),
                        );
                      }),

                  const SizedBox(height: 20,),

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
