// import 'package:expencetracker/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tracker/homepage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  // TextEditingController c1=TextEditingController();
  // TextEditingController c2=TextEditingController();
  // TextEditingController c3=TextEditingController();
  // TextEditingController c4=TextEditingController();
  // TextEditingController c5=TextEditingController();
  // TextEditingController c6=TextEditingController();

  



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expensetrack();
  }
  //  void adddata(){
    
  // }
  

  Future<void>expensetrack()async{
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homepage()));
    });  
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Center(
          child: Text("EXPENCE TACKER",
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold),),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            height: 550,
            width: double.infinity,

            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/10074/10074929.png")
          )
        ],
      ),
    );
  }
}