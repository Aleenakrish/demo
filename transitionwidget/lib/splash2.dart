import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: Text( "This is homepage"),
      ),
    );
  }
}