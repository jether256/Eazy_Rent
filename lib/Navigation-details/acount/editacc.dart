
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../crypt/encrypt.dart';
import '../dashboardnew.dart';

class EditAccountPro extends StatefulWidget {
  const EditAccountPro({super.key});

  @override
  State<EditAccountPro> createState() => _EditAccountProState();
}

class _EditAccountProState extends State<EditAccountPro> {

  final _fomkey=GlobalKey<FormState>();

  final _name=TextEditingController();
  final _num=TextEditingController();
  final _ema=TextEditingController();
  final _pass=TextEditingController();

  bool isLoggedIn=false;

  @override
  void initState() {
    getPref().then((value){
      getData();

    });

    super.initState();
  }

  getData() async{

    setState(() {
      _name.text='${nem}';
      _num.text='${num}';
      _ema.text='${email}';
      //_pass.text='${pass}';
    });


  }


  String? ID,nem,email,num, pass;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      ID= sharedPreferences.getString("id");
      nem= sharedPreferences.getString("name");
      email= sharedPreferences.getString("email");
      num= sharedPreferences.getString("phone");
      pass = sharedPreferences.getString("password");


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


  lougOut() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


    String? UID=sharedPreferences.getString("id");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users${UID}");

    sharedPreferences.remove("id");
    sharedPreferences.remove("name");
    sharedPreferences.remove("email");
    sharedPreferences.remove("password");
    sharedPreferences.remove("pic");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("last_log");
    sharedPreferences.remove("create_date");
    sharedPreferences.remove("addr");
    sharedPreferences.remove("lat");
    sharedPreferences.remove("lon");
    sharedPreferences.remove("token");
    sharedPreferences.remove("type");
    sharedPreferences.remove("status");
    sharedPreferences.remove("renew_date");
    sharedPreferences.remove("fcmid");


    if(mounted){
      Navigator.pushReplacementNamed(context, DashBoard.id);
    }

  }



  _scaffold(message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
      action: SnackBarAction(label: 'Ok',onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration:   BoxDecoration(
            color:Colors.lightBlue,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title:Text('Edit Account',maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //form
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: _fomkey,
                        child:Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextFormField(
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_outlined),
                                    labelText: 'Full Name',
                                    hintText: 'Full Name',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Enter your Name';

                                    }
                                    return null;
                                  }
                              ),

                              const SizedBox(height: 10,),

                              TextFormField(
                                  controller: _num,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.call),
                                      labelText: 'Phone No',
                                      hintText: 'Phone No',
                                      border: OutlineInputBorder()
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Enter your Phone Number';

                                    }
                                    return null;
                                  }
                              ),

                              const SizedBox(height: 10,),

                              TextFormField(
                                  controller: _ema,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      labelText: 'Email',
                                      hintText: 'Email',
                                      border: OutlineInputBorder()
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

                              TextFormField(
                                  controller: _pass,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.call),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      border: OutlineInputBorder()
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Password';

                                    }
                                    return null;
                                  }
                              ),


                              const SizedBox(height: 10,),

                              SizedBox(
                                width:double.infinity,
                                child: ElevatedButton(
                                    onPressed:() async {

                                      EasyLoading.show(status: 'Editing .....');

                                      if(_fomkey.currentState!.validate()) {
                                        var response = await http.post(
                                            Uri.parse(
                                                'https://eazyrent256.com/api/user/upuser.php'),
                                            headers: {
                                              "Accept": "headers/json"
                                            },
                                            body: {
                                              "id": encryp('${ID}'),
                                              "name": encryp(_name.text),
                                              "phone": encryp(_num.text),
                                              "email": encryp(_ema.text),
                                              "pass": encryp(_pass.text),
                                            });


                                        if (response.statusCode == 200) {

                                          EasyLoading.showSuccess(' Account Edited.....');

                                          lougOut();

                                        } else {



                                        }

                                        EasyLoading.dismiss();

                                      }




                                    },
                                    child: Text('Update'.toUpperCase(),style: const TextStyle(color: Colors.white),)
                                ),
                              ),

                              const SizedBox(height:40,),


                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
