import 'package:bloodbank/addpage.dart';
import 'package:flutter/material.dart';
// import 'package:project/secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child:Container(
              padding: EdgeInsets.only(top: 40),
              child: Text("GIVE THE GIFT OF LIFE",
              style: TextStyle(color: Colors.black,fontSize:20,
              fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),Container(
            padding: EdgeInsets.only(top: 5),
            child: Text("DONATE BLOOD",style: TextStyle(color: Colors.black,fontSize: 28,
              fontWeight: FontWeight.bold
              ),),
          ),

             Container(
              height: 550,
              width:  double.infinity,
              padding: EdgeInsets.only(top: 70),
             child: Image.asset("./images/bbb.jpeg")           
            ),
          
          // SizedBox(height: 10,),
          // Container(
          //   child: Text("Blood Bank",style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 30
          //     ),),
          // ),
          // SizedBox(height: 10,),
          // SizedBox(width: 100,),
          Container( 
          
            padding: EdgeInsets.only(top: 10),
            child:
             TextButton(
              onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder:(context)=>addpage()));
            },
             child:Text("Blood Bank",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
          )
        ],
      ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.push(context, MaterialPageRoute(builder:(context)=>addpage(),),);
      // },
      // child: Icon(Icons.add,color: Colors.white,),
      // ),
      
    ) ;
  }
}