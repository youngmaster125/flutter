import 'package:flutter/material.dart';

import '../../widgets/drawer.widget.dart';
class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),

        appBar: AppBar(title: const Text("Home",style: TextStyle(color: Colors.black), ),),
        body:  Center(
          child: Text("Meteo Page",style:Theme.of(context).textTheme.headlineMedium, ),

        )
    );
  }
}
