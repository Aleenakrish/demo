import 'package:bloodbank/addpage.dart';
import 'package:bloodbank/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Firstpage(),
    // home: addpage(),
    routes: {
      "/homepage":(context)=>Firstpage(),
      "/addpage":(context)=>addpage(),
    },
  ));
}