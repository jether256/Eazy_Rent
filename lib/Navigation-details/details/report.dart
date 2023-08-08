import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import '../../api/url.dart';
import '../../logged-signup/login.dart';

class Report extends StatefulWidget {
  final String id;
  final String userID;
  final String own;
  final String fon;
  final String biz;
  final String bizphon;
  final String mail;
  final String im1;
  final String im2;
  final String im3;
  final String im4;
  final String im5;
  final String tit;
  final String pr;
  final String desc;
  final String adu;
  final String lat;
  final String lon;
  final String place;
  final String bed;
  final String bath;
  final String fun;
  final String con;
  final String sq;
  final String cs;
  final String flo;
  final String kit;
  final String paid;
  final String start;
  final String end;
  final String blocked;
  final String type;
  final String proid;

  Report({ required this.id, required this.userID, required this.own, required this.fon, required this.biz, required this.bizphon, required this.mail, required this.im1, required this.im2, required this.im3, required this.im4, required this.im5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.place, required this.bed, required this.bath, required this.fun, required this.con, required this.sq, required this.cs, required this.flo, required this.kit, required this.paid, required this.start, required this.end, required this.blocked, required this.type, required this.proid});




  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  final _reportController=TextEditingController();
  final _desc=TextEditingController();

  ///lists
  ///List<String> urList=[];
  final List<String> _reportList=[
    'This is illegal/fraudulent',
    'This ad is spam',
    'This is wrong',
    'Wrong category',
    'Seller asked for prepayment',
    'it is sold',
    'User is unreachable',
    'Other',
  ];


  @override
  void initState(){
    super.initState();

  }




  Future<void> send() async {

    EasyLoading.show(status: 'Reporting...');

    var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/user/report.php'),

        body:{
          "title":widget.tit,
          "image":widget.im1,
          "pro_id":widget.proid,
          "report":_reportController.text,
          "describe":_desc.text,
        });



    if(response.statusCode==200){
      EasyLoading.showSuccess('Report Sent..');
    }else{

      EasyLoading.showError('Failed to Report');
    }

  }



  @override
  Widget build(BuildContext context) {

    //final _advertsProvider=Provider.of<AdvertsProvider>(context);

    Widget _appBar(title,fieldValue){

      return  AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        title: Text(widget.tit,style: const TextStyle(color: Colors.white),),
        actions: [
          IconButton(icon:const Icon(Icons.login), onPressed: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                )
            );

          },),
          //IconButton(icon:const Icon(Icons.logout), onPressed: () {  },),
          IconButton(icon:const Icon(Icons.notifications), onPressed: () {  },),
        ],
        elevation: 2,
        centerTitle: true,
        backgroundColor:Colors.lightBlue,
        automaticallyImplyLeading: false,
        //title: Text('$title>$fieldValue',style: const TextStyle(color: Colors.black,fontSize: 14),),
      );
    }

    Widget _listview({fieldValue,list,textController}){

      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _appBar('Select report reason',fieldValue),
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder:(BuildContext context, int index){
                  return ListTile(
                    onTap: (){
                      textController.text=list[index];
                      Navigator.pop(context);
                    },


                    title: Text(list[index]),

                  );
                })
          ],
        ),
      );
    }

    return Form(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
          title:  Text('Report  ${widget.tit}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          iconTheme: const IconThemeData(color: Colors.white),

        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: 50,
                        child:CachedNetworkImage(
                          imageUrl:'https://${BaseUrl.proImageUrl1}${widget.im1}',
                          fit: BoxFit.cover,
                          //placeholder: (context, url) =>,
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(widget.tit,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                    ],
                  ),

                  const SizedBox(height: 10,),
                  Text('Why do you want to report  ${widget.tit}?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: Container(
                      color: Colors.white24,
                      child:Column(
                        children: [

                          InkWell(
                            onTap: (){

                              showDialog(context: context, builder:(BuildContext context){
                                return _listview(fieldValue: 'Choose Reason',list: _reportList,textController: _reportController);

                              });

                            },
                            child: TextFormField(
                              enabled: false,
                              controller: _reportController,
                              decoration: InputDecoration(
                                  labelText: 'Choose reason*',
                                  labelStyle: const TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      )
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            keyboardType:TextInputType.multiline,
                            maxLines: 5,
                            maxLength: 500,
                            controller:_desc,
                            decoration: InputDecoration(
                                labelText: 'Describe your issue*',
                                labelStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),

                          MaterialButton(
                            color: Colors.lightBlue,
                            onPressed: (){

                              send();
                            },
                            child: const Text('REPORT',style: TextStyle(color: Colors.white),),
                          ),



                        ],
                      ) ,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
