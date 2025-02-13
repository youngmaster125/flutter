
import 'package:flutter/material.dart';
import 'dart:math';
class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    // TODO: implement createState

    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer=Random();
  var currentDiceRoll=5;
  var activeImageRollDice = "images/image.jpg";

  void rollDice() {
    setState(() {
         currentDiceRoll= randomizer.nextInt(6)+1;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("images/image$currentDiceRoll.jpg", width: 300, height: 300,),
        //  const   SizedBox(height: 30,),

        Center(
          child: TextButton(
              onPressed: rollDice, iconAlignment: IconAlignment.start,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 40),
              ),
              child: const Text("Roll Dice")
          ),
        )

      ],

    );
  }
}
