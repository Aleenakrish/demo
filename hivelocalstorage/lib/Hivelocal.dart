import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Hivelocal extends StatefulWidget {
  const Hivelocal({super.key});

  @override
  State<Hivelocal> createState() => _HivelocalState();
}

class _HivelocalState extends State<Hivelocal> {

  final _myBox= Hive.box("mybox");

  void WriteData(){
    _myBox.put(1, "flutter");
  }

  void ReadData(){
    print(_myBox.get(1));
  }

  void DeleteData(){
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HIVE PROGRAM"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(onPressed: WriteData,
            child: Text("Write Data"),
            color: Colors.blue,
            ),
             MaterialButton(onPressed: ReadData,
            child: Text("Read Data"),
            color: Colors.green,
            ),
             MaterialButton(onPressed: DeleteData,
            child: Text("Delete Data"),
            color: Colors.red,
            )
          ],
        ),
      ),

    );
  }
}