import 'package:flutter/material.dart';
import 'package:transitionwidget/hero1.dart';
import 'package:transitionwidget/hero2.dart';
import 'package:transitionwidget/splash1.dart';
// import 'package:transitionwidget/aaaa/hero1.dart';
// import 'package:transitionwidget/aaaa/hero2.dart';
// import 'package:transitionwidget/fadetransition.dart';
// import 'package:transitionwidget/heroanimation.dart';
// import 'package:transitionwidget/rotationaltransition.dart';
// import 'package:transitionwidget/scaletransition.dart';
// import 'package:transitionwidget/sizetransition.dart';
// import 'package:transitionwidget/slidetransition.dart';
void main(){
  runApp(MaterialApp(
    home: splash1(),
    // home: Sizetransition(),
    // home: Fadetransition(),
    // home: Scaletransition(),
    // home: Rotationaltransition(),
        // home: Slidetransition()
        // // home:Hero1(),
        // initialRoute: "/hero1",
        // routes: {
        //   "/hero1":(context)=>Hero1(),
        //   "/hero2":(context)=>Hero2()
        // },
  ),
  );
}