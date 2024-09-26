import 'package:flutter/material.dart';

class Animatedscale extends StatefulWidget {
  const Animatedscale({super.key});

  @override
  State<Animatedscale> createState() => _AnimatedscaleState();
}

class _AnimatedscaleState extends State<Animatedscale> {
   bool _isturn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          scale: _isturn? 1.5 : 1,
           duration: Duration(seconds: 1),
           child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
           ),
           ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isturn = !_isturn;
        });
      }),
    );
  }
}