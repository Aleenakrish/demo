import 'package:flutter/material.dart';

class Setstate2 extends StatefulWidget {
  // final numbers;
  
  const Setstate2({super.key,});

  @override
  State<Setstate2> createState() => _Setstate2State();
}

class _Setstate2State extends State<Setstate2> {
 
  List<int>numbers=[1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("setstate2"),
        actions: [
          IconButton(onPressed: (){
          }, 
          icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("Total Count is ${numbers.length}"),
          SizedBox(height: 20,),
          Expanded(
            child:ListView.builder(
              itemCount:numbers.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('${numbers[index]}'),
                );
              }) )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          numbers.add(numbers.last + 1);
        });
      },child: Icon(Icons.add),
      ),
    );
  }
}