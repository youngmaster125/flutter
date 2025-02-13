


import 'package:flutter/material.dart';

class GlobalParams{

   static List<Map<String ,dynamic>> menus=[
    {"title":"Counter","icon":const Icon(Icons.home),"route":"/counter"},
     {"title":"Meteo","icon":const Icon(Icons.timeline),"route":"/meteo"},
     {"title":"Gallery","icon":const Icon(Icons.camera),"route":"/gallery"},
     {"title":"Own App","icon":const Icon(Icons.text_decrease_rounded),"route":"/own"}
  ];
}