import 'package:flutter/material.dart';

class Setstate2 extends StatefulWidget {
  final numbers;
  
  const Setstate2({super.key,required this.numbers});

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
          Text("Total Count is ${widget.numbers.length}"),
          SizedBox(height: 20,),
          Expanded(
            child:ListView.builder(
              itemCount: widget.numbers.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('${widget.numbers[index]}'),
                );
              }) )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
         widget. numbers.add(widget.numbers.last + 1);
        });
      },child: Icon(Icons.add),
      ),
    );
  }
}