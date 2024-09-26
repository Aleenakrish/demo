import 'package:flutter/material.dart';

class Hero1 extends StatefulWidget {
  const Hero1({super.key});

  @override
  State<Hero1> createState() => _Hero1State();
}

class _Hero1State extends State<Hero1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero1"),
      ),
      body: Center(
        child: Hero(
          tag:'hero-image',
         child: 
         Image.network(
          "https://imgs.search.brave.com/1F5lslGryfDwYtaouMXJ43TzajaCSDP1TYQsueowng8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2QyLzUz/L2NiL2QyNTNjYmYy/MGJjNGFmZDdmY2My/ZTE3Y2YwNjcxZWI0/LmpwZw",
            height: 100,
            width: 200,
           )
         ),
      ),
    );
  }
}