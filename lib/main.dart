
import 'dart:io';


import 'package:eazy_rent/providers/aboutprovider.dart';
import 'package:eazy_rent/providers/ausi.dart';
import 'package:eazy_rent/providers/banapro.dart';
import 'package:eazy_rent/providers/busipro.dart';
import 'package:eazy_rent/providers/cat.dart';
import 'package:eazy_rent/providers/categoryproda.dart';
import 'package:eazy_rent/providers/catwithhouse.dart';
import 'package:eazy_rent/providers/chartdetail.dart';
import 'package:eazy_rent/providers/fairpro.dart';
import 'package:eazy_rent/providers/housepro.dart';
import 'package:eazy_rent/providers/popu.dart';
import 'package:eazy_rent/providers/random.dart';
import 'package:eazy_rent/providers/searchpro.dart';

import 'package:eazy_rent/providers/sliderpro.dart';
import 'package:eazy_rent/providers/chart.dart';
import 'package:eazy_rent/providers/termspro.dart';
import 'package:eazy_rent/providers/userprovider.dart';
import 'package:eazy_rent/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'logged-signup/login.dart';
import 'logged-signup/sign.dart';
import 'Navigation-details/dashboardnew.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{

 await Hive.initFlutter();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
FlutterNativeSplash.remove();

 ///handles expired certificate issues in flutter but expired in 2021..
 ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
 SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());


  Provider.debugCheckInvalidValueType=null;
  runApp(

    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create:(_) => CategoryProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => PopularProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => RandomProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => FairProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => BusinessProvider(),
        ),


        ChangeNotifierProvider(
          create:(_) =>SearchProvider(),
        ),


        ChangeNotifierProvider(
          create:(_) =>TermsProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) =>AboutProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) =>BanaProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) =>HouseProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) =>CategoryProProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => UserProvider(),
        ),


        ChangeNotifierProvider(
          create:(_) => CatHouseProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => HouseIDProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => SliderProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => ChartRoomProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => ChatDetailsProvider(),
        ),
      ],
      child: const MyApp(),
    ),

  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eazy Rent',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      builder:EasyLoading.init(),
      initialRoute: Splash.id,// first route
      routes: {
        //we will add the screens here for easy navigation

        Splash.id:(context)=>Splash(),
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen(),
        DashBoard.id:(context)=>DashBoard(),
      },
    );
  }
}
