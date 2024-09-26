import 'package:flutter/material.dart';

class Animatedlist extends StatefulWidget {
  const Animatedlist({super.key});

  @override
  State<Animatedlist> createState() => _AnimatedlistState();
}

class _AnimatedlistState extends State<Animatedlist> {
  GlobalKey<AnimatedListState> _listkey = GlobalKey<AnimatedListState>();
  List _item = [];
  int counter = 0;

  void _additems(){
    setState(() {
      _item.insert(0, 'item  ${counter++}');
      _listkey.currentState 
      ?.insertItem(0,duration: Duration(milliseconds: 300));
      
    });
    print(_item);
  }
  void _removeItem(index){
    final String removedItem = _item.removeAt(index);
    _listkey.currentState?.removeItem(index, (context, Animation){
      return SizeTransition(
        sizeFactor: Animation,axisAlignment: 0,
        child: ListTile(
          title: Text("item remove"),
        ),
        );
    },
    duration: Duration(milliseconds: 500)
    );
    print(removedItem);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AnimatedList"),
        ),
        actions: [IconButton(onPressed: _additems, 
        icon: Icon(Icons.add))],
      ),
      body: AnimatedList(
        key: _listkey,
        initialItemCount: _item.length,
        itemBuilder: (context , index ,Animation){
          return SizeTransition(
            sizeFactor: Animation,
            child: ListTile(
              title: Text(_item[index]),
              trailing: IconButton(onPressed: (){
               _removeItem(index);
              }, 
              icon: Icon(Icons.delete)),
            ),


          );

      }),
    );
  }
}