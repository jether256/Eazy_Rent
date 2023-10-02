
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/aboutprovider.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<AboutProvider>(context,listen: false).getAbout();


    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          //leading: IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
          //leading: Image.asset("assets/images/logo.png",color: Colors.white,),
          title: const Text('About Us',style: TextStyle(color: Colors.white),),
          actions: [
            // IconButton(icon:const Icon(Icons.login_outlined), onPressed: () {
            //
            //   lougOut();
            // },),

          ],
          elevation: 2,
          centerTitle: true,
          backgroundColor:Colors.lightBlue,

        ) ,
        body:Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
          child: Container(
            child: Consumer<AboutProvider>(
              builder: (context,value,child){

                final pros=value.about;

                if(value.isLoading){

                  return GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 1/1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Image.asset('assets/images/hug.gif'),
                        );



                      }
                  );

                }

                else if(value.isNet){

                  return GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 1/1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Image.asset('assets/images/disconnected.png'),
                        );



                      }
                  );
                }

                else{




                  return ListView.builder(
                      itemCount: pros.length,

                      itemBuilder:(context,index){

                        return Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(pros[index].Nem),
                          ),
                        );



                      }
                  );
                }


              },
            ),
          ),
        ),

      ),
    );
  }
}
