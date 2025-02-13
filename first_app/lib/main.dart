import 'package:first_app/ui/pages/counter.page.dart';
import 'package:first_app/ui/pages/gallery.page.dart';
import 'package:first_app/ui/pages/gradientContainer.dart';
import 'package:first_app/ui/pages/home.page.dart';
import 'package:first_app/ui/pages/meteo.page.dart';
import 'package:first_app/ui/pages/ownPage.dart';
import 'package:first_app/ui/pages/styleText.dart';
import 'package:first_app/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';


void main()=> runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       "/":(context)=>const HomePage(),
        "/own":(context)=> const OwnPage(),
        "/meteo":(context)=>const MeteoPage(),
        "/gallery":(context)=>const GalleryPage(),
        "/counter":(context)=> const CounterPage(),
        "/style":(context)=>const Styletext(),
        "/gradient":(context)=> Gradientcontainer(Colors.white,Colors.black)
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
       appBarTheme: const AppBarTheme(
         backgroundColor: Colors.deepOrange
       )
       // brightness: Brightness.light,


      ),
        //  home: const HomePage(),
    );
  }
}



  

