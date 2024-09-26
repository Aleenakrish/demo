import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 76, 38) ,
        title: Text("Add Details",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 226, 76, 38)),
                      // labelText: ,
                      border: InputBorder.none
                    ),
                  ),

                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 226, 76, 38)),
                      // labelText: ,
                      border: InputBorder.none
                    ),
                  ),

                      ),
                      
                    ],

                  ),
                )
              ],
        
        ),
      ),
    );
  }
}