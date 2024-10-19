import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ToDo/Todo1.dart';
import 'package:todo/ToDo/Todo3.dart';
import 'package:todo/ToDo/todo2.dart';
import 'package:todo/provider/numberListProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => NumberListProvider(),
  child: MaterialApp(home: ToDO1(),
  routes: {
    "/todo1":(context)=>ToDO1(),
    "/todo2":(context)=>ToDo2(),
    "/todo3":(context)=>ToDo3(),

  },
  ),
  ));
}
