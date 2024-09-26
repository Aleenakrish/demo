import 'package:flutter/material.dart';

class Slidetransition extends StatefulWidget {
  const Slidetransition({super.key});

  @override
  State<Slidetransition> createState() => _SlidetransitionState();
}

class _SlidetransitionState extends State<Slidetransition> 
with SingleTickerProviderStateMixin{
  late AnimationController _controller=
  AnimationController(vsync: this , duration: Duration(milliseconds: 1000));
  late Animation<Offset> slideTransition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideTransition = Tween<Offset>(begin: Offset(0, -1),end: Offset.zero)
    .animate(_controller);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: slideTransition,
          child: Text("Synnefo solutios"),
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