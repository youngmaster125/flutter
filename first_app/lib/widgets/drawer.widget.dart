

import 'package:first_app/config/globalparams.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.deepOrange
                      ]
                  )
              ) ,
              child: Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/lou.jpg"),
                    ),

                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/da.jpg"),
                    ),
                  ],
                ),
              )
          ),
         ...(GlobalParams.menus as List).map((item) {
           // Check that 'title' exists in the item map to avoid runtime errors
           String title = item['title'] ?? 'Untitled';
           return Column(
             children: [
                ListTile(
                  title:  Text('${item['title']}',style: const TextStyle(fontSize: 22),),
                  leading: item['icon'], // const Icon(Icons.map, color: Colors.deepOrange,),
                  trailing: const Icon(Icons.arrow_right,color: Colors.deepOrange,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '${item['route']}');
                  },
                ),
               const Divider(height: 1, color: Colors.black,),
              ],
           );
          })


         /*
          ListTile(
            title: const Text('Counter',style: TextStyle(fontSize: 22),),
            leading: const Icon(Icons.home, color: Colors.deepOrange,),
            trailing: const Icon(Icons.arrow_right,color: Colors.deepOrange,),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/counter");
            },
          ),
         onst Divider(height: 1, color: Colors.black,), c
          ListTile(
            title: const Text('Meteo',style: TextStyle(fontSize: 22),),
            leading: const Icon(Icons.browse_gallery_outlined, color: Colors.deepOrange,),
            trailing: const Icon(Icons.arrow_right,color: Colors.deepOrange,),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/meteo");
            },
          ),
          const Divider(height: 1, color: Colors.black,),
          ListTile(
            title: const Text('Gallery',style: TextStyle(fontSize: 22),),
            leading: const Icon(Icons.camera, color: Colors.deepOrange,),
            trailing: const Icon(Icons.arrow_right,color: Colors.deepOrange,),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/gallery");
            },
          ),
          const Divider(height: 1, color: Colors.black,),
          */
        ],
      ) ,
    );
  }
}