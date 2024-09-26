import 'package:flutter/material.dart';

class Animatedicon extends StatefulWidget {
  const Animatedicon({super.key});

  @override
  State<Animatedicon> createState() => _AnimatediconState();
}

class _AnimatediconState extends State<Animatedicon> 
with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  bool _isturn = false;
  
  
  @override

  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  
  // void initstate(){
  //   super.initState();
  //   _controller = 
  //   AnimationController(vsync: this, duration: Duration(milliseconds: 500));

  // }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: AnimatedIcon(
            icon: _isturn 
            ? AnimatedIcons.menu_arrow 
            : AnimatedIcons.menu_close, 
            progress: _controller ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isturn = !_isturn;
          _controller.forward(from: 0);
        });
      },
      child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}