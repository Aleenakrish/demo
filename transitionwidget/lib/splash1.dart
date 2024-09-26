import 'package:flutter/material.dart';
import 'package:transitionwidget/splash2.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hidescreen();
  }

  Future<void>hidescreen()async{
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Splash2()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Center(
        
        child: Column(
          children: [
            Center(
              child: Container(
                 child:Container(
                  child:
                    Icon(
                Icons.flash_on,
                color: Colors.white,size: 100,
                ),
                 ),         
                
              ),
            ),
            Center(
              child: Container(
                child: Text("FLASH LIGHT",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
       
      ),
    );
  }
}