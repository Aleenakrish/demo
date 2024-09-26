import 'package:flutter/material.dart';

class crossfade extends StatefulWidget {
  const crossfade({super.key});

  @override
  State<crossfade> createState() => _crossfadeState();
}

class _crossfadeState extends State<crossfade> {
  bool _isshow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedCrossFade(firstChild:IconButton(onPressed: (){
        setState(() {
          _isshow = true;
        });
      },
       icon: Icon(Icons.play_arrow)) , 

      secondChild: IconButton(onPressed: (){
        setState(() {
          _isshow = false;
        });
      },
      icon: Icon(Icons.pause)), 

      crossFadeState: _isshow ? CrossFadeState.showSecond : CrossFadeState.showFirst, 
      duration: Duration(milliseconds: 500)
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isshow = !_isshow; 
        });
      },
      child: Icon(Icons.switch_access_shortcut),
      ),

    );
  }
}