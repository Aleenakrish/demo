import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ToDo/Todo3.dart';
import 'package:todo/ToDo/todo2.dart';
import 'package:todo/provider/numberListProvider.dart';

class ToDO1 extends StatefulWidget {
  const ToDO1({super.key});

  @override
  State<ToDO1> createState() => _ToDO1State();
}

class _ToDO1State extends State<ToDO1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, TodoListModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 122, 159, 221),
                title: Center(
                    child: Text(
                  "TODO LIST",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: TodoListModel.ls.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        "Do you want to Delete?",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 122, 159, 221),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 122, 159, 221),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                TodoListModel.ls
                                                    .removeAt(index);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text("Delete",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, top: 10, left: 20, right: 20),
                              padding: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * .10,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // // color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(blurRadius: 5, color: Colors.grey)
                                // ]
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${TodoListModel.ls[index]}"),
                                  GestureDetector(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/todo3",
                                            arguments: index.toString());
                                      },
                                      child: Text(
                                        "EDIT",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 122, 159, 221)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              floatingActionButton: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ToDo2()));
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 122, 159, 221),
                        fontSize: 20),
                  )),
            ));
  }
}
