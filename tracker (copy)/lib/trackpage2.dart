import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ExpensePage2 extends StatefulWidget {
  const ExpensePage2({super.key});

  @override
  State<ExpensePage2> createState() => _ExpensePage2State();
}

class _ExpensePage2State extends State<ExpensePage2> {
  TextEditingController money = TextEditingController();
  TextEditingController paid = TextEditingController();
  TextEditingController food = TextEditingController();
  List<dynamic> ls = [];
  final _track = Hive.box("myBox");
  void addData() {
    if (_track.get("1") != null) {
      ls = _track.get("1");

      ls.add({"money": money.text, "paid": paid.text, "food": food.text});
      _track.put("1", ls);
    } else {
      ls = [
        {"money": money.text, "paid": paid.text, "food": food.text}
      ];
      print(_track.get("1"));
      _track.put("1", ls);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add New Expenses",
          style: TextStyle(
              color: const Color.fromARGB(255, 235, 184, 19),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 50),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 235, 184, 19),
              ),
              child: Center(
                  child: Text(
                "EXPENSE",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 243, 239, 203),
            ),
            child: TextField(
              controller: money,
              decoration: InputDecoration(
                  hintText: "Spend Money",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 235, 184, 19),
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 243, 239, 203),
            ),
            child: TextField(
              controller: paid,
              decoration: InputDecoration(
                  hintText: "Paid to (name or place)",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 243, 239, 203),
            ),
            child: TextField(
              controller: food,
              decoration: InputDecoration(
                  hintText: "Food item",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 235, 184, 19),
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 243, 239, 203),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 243, 239, 203),
                              title: Text(
                                "ADD BILL",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 235, 184, 19)),
                              ),
                              actions: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 235, 184, 19),
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 243, 239, 203)),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 235, 184, 19),
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 243, 239, 203)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      "Bill",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 235, 184, 19),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 235, 184, 19),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.white),
                      ))),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 235, 184, 19),
                ),
                child: TextButton(
                    onPressed: () {
                      addData();
                      Navigator.pushNamed(context, "track1");
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}