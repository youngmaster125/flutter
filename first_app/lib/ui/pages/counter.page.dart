
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
   const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"),),
      body: Center(
        child: Text("Counter Value =>$counter",
          style: const TextStyle(fontSize: 22,color: Colors.blue)
          ,),

      ) ,
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (){
                setState(() {
                  ++counter;
                });
              }
          ),
            const SizedBox(width: 8,),
          FloatingActionButton(

              child: const Icon(Icons.remove),
              onPressed: (){
                setState(() {
                  --counter;
                });
              }
          ),
        ],
      ),
    );
  }
}
