import 'package:flutter/material.dart';

import '../../widgets/drawer.widget.dart';
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),

        appBar: AppBar(title: const Text("Home",style: TextStyle(color: Colors.white), ),),
        body:  Center(
          child: Text("Gallery Page",style:Theme.of(context).textTheme.headlineMedium, ),

        )
    );
  }
}