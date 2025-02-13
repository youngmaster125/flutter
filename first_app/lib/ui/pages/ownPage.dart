import 'package:first_app/ui/pages/gradientContainer.dart';
import 'package:flutter/material.dart';

class OwnPage extends StatelessWidget {
  const OwnPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:  Drawer(
        child:ListView(
          children:[
            Column(

              children: [

                const DrawerHeader(

                  decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black,Colors.white
                          ]
                      ),

                  ) ,
                child: Center(
                  child: Row(
                    children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("images/da.jpg"),
                        ),
                      Text("Daelle",style: TextStyle(fontSize: 20 ),)
                    ],
                  ),
                ),

                ),

                ListTile(
                  title: const Text("Style text",style: TextStyle(
                      color: Colors.black
                  ),),
                  trailing: const Icon(Icons.arrow_right),
                  leading: const Icon(Icons.camera),
                  onTap:(){
                     Navigator.of(context).pop();
                     Navigator.pushNamed(context, '/style');
                  },
                ),
                ListTile(
                  title: const Text("Container",style: TextStyle(
                      color: Colors.black
                  ),),
                  trailing: const Icon(Icons.arrow_right),
                  leading: const Icon(Icons.settings),
                  onTap:(){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/gradient');
                  },
                ),

              ],

            ),

          ],
        )

      )
      ,
    appBar: AppBar(
      title: const Text("Salens"),
    ),
     
      body:  const BottomAppBar(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Icon(Icons.ice_skating),
           Text("Cat"),
           
         ],
       ),
      ),
    );
  }
}
