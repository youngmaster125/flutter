
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("asset/images/quiz-logo.png", width: 300,
                  color: const Color.fromARGB(150, 255, 255, 255)),
              const SizedBox( height: 50,),

              const Text("Welcome to my Quiz",style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: "Calibri"
              ),),
              TextButton(onPressed:startQuiz, child: const Text("start quiz",style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),)),
              const SizedBox(height: 90,)
            ],

        ),

      );
  }
}