import 'package:flutter/material.dart';

class Animatedrotation extends StatefulWidget {
  const Animatedrotation({super.key});

  @override
  State<Animatedrotation> createState() => _AnimatedrotationState();
}

class _AnimatedrotationState extends State<Animatedrotation> {

  bool _isturn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
          turns: _isturn ?1:0, 
          duration: Duration(seconds: 1),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: Text("hello"),
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isturn = ! _isturn;
        });
      },child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}