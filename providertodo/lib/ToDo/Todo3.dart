import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/numberListProvider.dart';

class ToDo3 extends StatefulWidget {
  const ToDo3({super.key});

  @override
  State<ToDo3> createState() => _ToDo3State();
}

class _ToDo3State extends State<ToDo3> {
  int? index;
  TextEditingController add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    index = int.parse(ModalRoute.of(context)!.settings.arguments as String);
    return Consumer<NumberListProvider>(
        builder: (context, TodoListModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 122, 159, 221),
                title: Center(
                    child: Text(
                  "Edit Tasks",
                  style: TextStyle(color: Colors.white),
                )),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.grey)
                            ]),
                        child: TextField(
                          onTap: () {
                            add.text = TodoListModel.ls[index!];
                          },
                          controller: add,
                          decoration: InputDecoration(
                              hintText: "Edit Tasks",
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 122, 159, 221)),
                              border: InputBorder.none),
                          style: TextStyle(
                              color: const Color.fromARGB(255, 122, 159, 221)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.grey)
                            ]),
                        child: TextButton(
                            onPressed: () {
                              TodoListModel.ls[index!] = add.text;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/todo1", (route) => false);
                            },
                            child: Text(
                              "EDIT",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 122, 159, 221)),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
