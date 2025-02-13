import 'package:flutter/material.dart';
import 'package:git_hub_mobile_app/pages/user/user.page.dart';

import 'pages/home/home.page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       '/home':(context)=>const HomePage(),
        '/users':(context)=>UsersPage()
      },
      initialRoute: "/users",
      home: const HomePage(),
    );
  }
}






