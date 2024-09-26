
import 'package:contact/aaa/addcontact.dart';
import 'package:contact/aaa/contacthome.dart';
import 'package:contact/aaa/displaycontact.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: ContactHome(),
      routes: {
        "/contacthome":(context)=>ContactHome(),
        "/addcontact":(context)=>AddContact(),
        "/displaycontact":(context)=>DisplayContact()
      },
    )
  );
}