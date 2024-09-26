import 'package:flutter/material.dart';

class Animateddefault extends StatefulWidget {
  const Animateddefault({super.key});

  @override
  State<Animateddefault> createState() => _AnimateddefaultState();
}

class _AnimateddefaultState extends State<Animateddefault> {

  bool _isText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedDefaultTextStyle(
        child:Text("Hello world"), 
      style: TextStyle(
          fontSize: _isText ? 50 : 20,
          fontWeight: _isText ? FontWeight.bold : FontWeight.normal,
          color: _isText ? Colors.black : Colors.green
      ) , 
      duration: Duration(milliseconds: 500),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       setState(() {
         _isText = !_isText;
       });
      },
      child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}