
import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:first_app/ui/pages/styleText.dart';

class  Gradientcontainer extends StatelessWidget {
   Gradientcontainer(this.color1,this.color2,{super.key });
   final Color  color1;
   final Color color2;
  var acticeDiceImage="images/lou.jpg";
   void rollDice(){
acticeDiceImage="images/lou.jpg";
   }
  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [color1,color2],
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
        )

      ),
   child: const Center(
     child: DiceRoller()
     ),

   //   child: const Center(child:  Styletext()),

      );
  }
}
