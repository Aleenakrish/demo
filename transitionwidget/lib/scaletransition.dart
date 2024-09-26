import 'package:flutter/material.dart';

class Scaletransition extends StatefulWidget {
  const Scaletransition({super.key});

  @override
  State<Scaletransition> createState() => _ScaletransitionState();
}

class _ScaletransitionState extends State<Scaletransition> 
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
           ScaleTransition(
            scale: _controller,
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