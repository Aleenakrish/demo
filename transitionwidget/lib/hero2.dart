import 'package:flutter/material.dart';

class Hero2 extends StatefulWidget {
  const Hero2({super.key});

  @override
  State<Hero2> createState() => _Hero2State();
}

class _Hero2State extends State<Hero2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero2"),
      ),
      body: Hero(tag: 'hero-image',
       child: 
       Image.network(
        "https://imgs.search.brave.com/1F5lslGryfDwYtaouMXJ43TzajaCSDP1TYQsueowng8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2QyLzUz/L2NiL2QyNTNjYmYy/MGJjNGFmZDdmY2My/ZTE3Y2YwNjcxZWI0/LmpwZw",
          height: 300,
          width: 300,
         )
       ),
    );
  }
}