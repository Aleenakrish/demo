import 'package:flutter/material.dart';

class Statementpage extends StatefulWidget {
  const Statementpage({super.key});

  @override
  State<Statementpage> createState() => _StatementpageState();
}

class _StatementpageState extends State<Statementpage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
    appBar: AppBar(
      backgroundColor: Colors.green[100],
      title: Center(
        child: Text("STATEMENTS"),
      ),
    ),
    body: ListView(
      children: [
        Column(
          children: [
            SizedBox(height: 30,),
            Container(
              // padding: EdgeInsets.only(top: 60),
             height: 250,
             width: 400,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green[50],
              boxShadow: [
                BoxShadow(blurRadius: 6, color: Colors.green)
              ]
             ),
            ),
          ],
        )
      ],
    )
    );
  }
}