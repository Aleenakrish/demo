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
  int value=0;
  final _track = Hive.box("myBox");
  DateTime date=DateTime.now();

  void addData() {
    if (_track.get("1") != null) {
      ls = _track.get("1");

      ls.add({
        "money": money.text, 
        "paid": paid.text, 
        "food": food.text,
        "date":"${date.day.toString().padLeft(2,"0")}-${date.month.toString().padLeft(2,"0")}-${date.year.toString().padLeft(2,"0")}",
        "time":"${date.hour.toString().padLeft(2,"0")}:${date.minute.toString().padLeft(2,"0")}"
        });
      _track.put("1", ls);
    } else {
      ls = [
        {
          "money": money.text, 
          "paid": paid.text, 
          "food": food.text,
          "date":"${date.day.toString().padLeft(2,"0")}-${date.month.toString().padLeft(2,"0")}-${date.year.toString().padLeft(2,"0")}",
        "time":"${date.hour.toString().padLeft(2,"0")}:${date.minute.toString().padLeft(2,"0")}"
          }
      ];
      print(_track.get("1"));
      _track.put("1", ls);
    }
    addMoney();
  }
  void addMoney(){
    setState(() {
       if (_track.get("3") != null) {
        value = int.parse(_track.get("3"));
        value = value + int.parse(money.text);
        _track.put("3", value.toString());
      } else {
        _track.put("3", money.text);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          "Add Expenses",
          style: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        //   Center(
        //     child: Container(
        //       margin: EdgeInsets.only(left: 50, top: 50),
        //       width: 200,
        //       height: 40,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color:Colors.green[50]
        //       ),
        //       // child: Center(
        //       //     child: Text(
        //       //   "EXPENSE",
        //       //   style: TextStyle(color:Colors.black),
        //       // )),
        //     ),
        //   ),
          SizedBox(
            height: 50,
          ),
          Container(
            // margin: EdgeInsets.only(left: 50, right: 50),
            width: 350,
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
              color: Colors.green[50],
            ),
            child: TextField(
              controller: money,
              decoration: InputDecoration(
                  hintText: "Spend Money..",
                  hintStyle: TextStyle(
                      color:Colors.black,
                      ),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
             width: 350,
            height: 50,
            
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
             color:Colors.green[50],
            ),
            child: TextField(
              controller: paid,
              decoration: InputDecoration(
                  hintText: "Paid..",
                  hintStyle: TextStyle(
                     color: Colors.black, ),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
             width: 350,
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
              color:Colors.green[50],
            ),
            child: TextField(
              controller: food,
              decoration: InputDecoration(
                  hintText: "item.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      ),
                      
                  border: InputBorder.none),
                 
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
               width: 70,
            height: 50,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                color:Colors.green[50],
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
                                  Colors.green[50],
                              title: Text(
                                "BILL",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black),
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
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                                       color:Colors.green[800],
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                color:Colors.white,),
                                          )),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                                       color:Colors.green[800],
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                               color: Colors.white),
                                          )),
                                    ),
                                   
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      "Bill",
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))),
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Container(
                
                width: 90,
                  height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                 color:Colors.green[800],
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
              ),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                 
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                    color:Colors.green[800],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.white),
                      ))),
                      SizedBox(width: 20,),
              // Container(
                
              //   width: 90,
              //     height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //      boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
              //    color:Colors.green[800],
              //   ),
              //   child: TextButton(
              //       onPressed: () {
              //         addData();
              //         Navigator.pushNamed(context, "track1");
              //       },
              //       child: Text(
              //         "SAVE",
              //         style: TextStyle(color: Colors.white),
              //       )),
              // )
            ],
          )
        ],
      ),
    );
  }
}