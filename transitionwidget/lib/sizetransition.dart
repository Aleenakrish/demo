import 'package:flutter/material.dart';

class Sizetransition extends StatefulWidget {
  const Sizetransition({super.key});

  @override
  State<Sizetransition> createState() => _SizetransitionState();
}

class _SizetransitionState extends State<Sizetransition> 
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

//  void initState(){
//     super.initState();
//     _controller.forward();
//  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizeTransition(sizeFactor:_controller,
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