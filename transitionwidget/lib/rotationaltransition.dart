import 'package:flutter/material.dart';

class Rotationaltransition extends StatefulWidget {
  const Rotationaltransition({super.key});

  @override
  State<Rotationaltransition> createState() => _RotationaltransitionState();
}

class _RotationaltransitionState extends State<Rotationaltransition> 
with SingleTickerProviderStateMixin{
  late AnimationController _controller 
  =AnimationController(vsync: this,duration: Duration(milliseconds: 500));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          RotationTransition(
            turns: _controller,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,

            ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if(_controller.isDismissed){
          _controller.forward();         
        }else{
          _controller.reverse();
        }
      },child: Icon(Icons.add),
      ),
    );
  }
}