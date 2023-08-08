import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactEazy extends StatefulWidget {
  const ContactEazy({super.key});

  @override
  State<ContactEazy> createState() => _ContactEazyState();
}

class _ContactEazyState extends State<ContactEazy> {

  _scaffold(message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
      action: SnackBarAction(label: 'ok',onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor:Colors.grey[100],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.lightBlue,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Contact Us', style: TextStyle(color: Colors.white,),),
          ),
          body: ListView(
            shrinkWrap: true,
            padding:const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
            children: [


              const SizedBox(height: 10,),

              InkWell(
                onTap:(){

                  _makePhoneCall('+256778316724');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Icon(Icons.call,size: 40,),
                    Expanded(child: Text('+256778316724',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 17),)),
                  ],
                ),
              ),

              const SizedBox(height: 10,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Icon(Icons.mail,size: 40,),
                  Expanded(child: Text('eazyrent@gmail.com',maxLines: 2,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 17),)),
                ],
              ),

              const SizedBox(height: 10,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Image.asset('assets/images/facebook.png',height: 40,width: 40,),
                  Expanded(child: Text(' Facebook',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 17),)),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Image.asset('assets/images/twitter.png',height: 40,width: 40,),
                  Expanded(child: Text(' Twitter',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 17),)),
                ],
              ),

              const SizedBox(height: 10,),


              InkWell(
                onTap: (){

                  openWhatsapp();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Image.asset('assets/images/whatsapp.png',height: 40,width: 40,),
                    Expanded(child: Text('Whatsapp',maxLines: 1,overflow:TextOverflow.ellipsis,style: const TextStyle(fontSize: 17),)),
                  ],
                ),
              ),

              const SizedBox(height: 10,),

            ],
          )
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path:phoneNumber,
    );
    await launchUrl(launchUri);
  }



  openWhatsapp() async {

    String whatsapp = '+256778316724';
    String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=Hallo Eazy Rent";
    String whatsappURLIos =
        "https://wa.me/$whatsapp?text=${Uri.parse("Hallo Eazy Rent ")}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        _scaffold("Whatsapp not installed");
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        _scaffold("Whatsapp not installed");
      }
    }
  }

}
