import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

  // final id = Hive.box("student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STUDENT ID"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                 padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 255, 255, 255)
                  ),
                  height: 50,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), 
                   color: const Color.fromARGB(255, 255, 255, 255)
                  ),
                 
                  child: TextButton(onPressed: (){},
                   child: Text("add",
                   style: TextStyle(
                    color: Colors.black),)
                   ),
                )
              ],
            )
           
          ],
        ),
      ),
    );
  }
}