import 'package:flutter/material.dart';

class animatedopacity extends StatefulWidget {
  const animatedopacity({super.key});

  @override
  State<animatedopacity> createState() => _animatedopacityState();
}

class _animatedopacityState extends State<animatedopacity> {
  bool IsOpacity=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(opacity:IsOpacity?1:0, duration: Duration(milliseconds: 500),
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          IsOpacity = !IsOpacity;
        }
        );
      },
      child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}