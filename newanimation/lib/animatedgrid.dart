import 'package:flutter/material.dart';

class Animatedgrid extends StatefulWidget {
  const Animatedgrid({super.key});

  @override
  State<Animatedgrid> createState() => _AnimatedgridState();
}

class _AnimatedgridState extends State<Animatedgrid> {
  List<int> ls =[];
  final GlobalKey<AnimatedGridState>
  _gridkey = GlobalKey<AnimatedGridState>();


  void _insertItem(index){
    ls.insert(index , ls.length);
    _gridkey.currentState ?.insertItem(index,duration:Duration(milliseconds: 300) );
  }
  void _removeItem(index){
    ls.removeAt(index);
    _gridkey.currentState ?.removeItem(index,(context,animation){
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation, 
          curve: Curves.easeInOutBack,),
          child: Card(
            child: Center(
              child: Text("item Removed"),
            ),
          ),
      );

    },duration: Duration(milliseconds: 1000)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Grid Animation"),
        ),
      ),
      body: AnimatedGrid(
        key: _gridkey,
        itemBuilder: (context, index,animation){
          return FadeTransition(
            opacity: animation,
            child: Card(
              shadowColor: Colors.black,
              elevation: 4,
                child: ListTile(
              title: Text(ls[index].toString()),
              trailing: 
              IconButton(onPressed: (){
                _removeItem(index);
              }, 
              icon: Icon(Icons.delete)),
            ),
            ),


          
            );
        } ,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2)),
         floatingActionButton: FloatingActionButton(onPressed: (){
            _insertItem(ls.length);
         },
         child: Icon(Icons.add),
         ),
    );
  }
}