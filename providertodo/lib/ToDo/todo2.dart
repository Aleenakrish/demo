import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/numberListProvider.dart';

class ToDo2 extends StatefulWidget {
  const ToDo2({super.key});

  @override
  State<ToDo2> createState() => _ToDo2State();
}

class _ToDo2State extends State<ToDo2> {
  TextEditingController add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, TodoListModel, child) => Scaffold(
              appBar: AppBar(
                // backgroundColor: const Color.fromARGB(255, 122, 159, 221),
                title: Center(
                    child: Text(
                  "Add page",
                  style: TextStyle(color: Colors.black),
                )),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 300,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                            boxShadow: [
                              // BoxShadow(blurRadius: 5, color: Colors.grey)
                            ]),
                        child: TextField(
                          controller: add,
                          decoration: InputDecoration(
                              hintText: "Add..",
                              hintStyle: TextStyle(
                                  color:
                                     Colors.black),
                                      border: OutlineInputBorder(

                                      )
                              // border: InputBorder.none
                              ),
                          style: TextStyle(
                              color:Colors.black),
                        ),
                      ),
                      Container(
                       
                        // margin: EdgeInsets.all(10),   

                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                           ),
                        child: TextButton(
                            onPressed: () {
                              var task = add.text;
                              TodoListModel.addList(task);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/todo1", (route) => false);
                            },
                            child: Icon(Icons.add,size: 25,
                            color: Colors.black,
                            )
                            // Text(
                            //   "ADD",
                            //   style: TextStyle(
                            //       color:
                            //          Colors.black,fontSize: 18),
                            // )
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
