import 'package:expencetracker/firstpage.dart';
import 'package:expencetracker/homepage.dart';
import 'package:expencetracker/statementpage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");

  runApp(
    MaterialApp(
      home: Firstpage(),
      // home: Homepage(),
      // home: Statementpage(),
      routes: {
        "firstpage":(context)=>Firstpage(),
        "homepage":(context)=>Homepage(),
        "statementpage":(context)=>Statementpage()
      },
    )
  );
}