
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/firstpage.dart';
import 'package:tracker/homepage.dart';
import 'package:tracker/statementpage.dart';

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