import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ExpensePage1 extends StatefulWidget {
  const ExpensePage1({super.key});

  @override
  State<ExpensePage1> createState() => _ExpensePage1State();
}

class _ExpensePage1State extends State<ExpensePage1> {
  TextEditingController income = TextEditingController();
  TextEditingController money=TextEditingController();
  final _track = Hive.box("myBox");
  int value = 0;
  List<dynamic> ls = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  void addIncome() {
    setState(() {
      if (_track.get("key") != null) {
        value = int.parse(_track.get("key"));
        value = value + int.parse(income.text);
        _track.put("key", value.toString());
      } else {
        _track.put("key", income.text);
      }
      Navigator.pop(context);
    });
  }

  void readData() {
    if (_track.get("1") != null) {
      ls = _track.get("1");
    } else {
      print(ls);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor:Colors.green[100],
        title: Center(
            child: Text(
          "EXPENSE TRACKER",
          style: TextStyle(color: Colors.black),
        )),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, "track2");
          //     },
          //     icon: Icon(
          //       Icons.add,
          //       color: Colors.black,
          //       size: 40,
          //     ))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color:Colors.green[100]
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: EdgeInsets.only(left: 70, right: 50, top: 20),
          padding: EdgeInsets.all(20),
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
            color:Colors.green[50],
            
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //   Text("", style: TextStyle(fontSize: 50, color:Colors.black)),
                //   SizedBox(width: 15,),
                //  _track.get("3")==null? Text(
                //     "",
                //     style: TextStyle(fontSize: 50, color:Colors.black),
                //   ):Text(_track.get("3"), style: TextStyle(fontSize: 50, color:Colors.black),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Expense  :",
                      style:
                          TextStyle(color:Colors.black, fontSize: 20)),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(height: 20,),
                  Text("Income", style: TextStyle(color:Colors.black,fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(":", style: TextStyle(fontSize: 20, color: Colors.black)),
                   SizedBox(
                    width: 10,
                  ),
                  _track.get("key") == null
                      ? Text("",
                          style: TextStyle(
                             color:Colors.black, fontSize: 20))
                      : Text(_track.get("key"),
                          style: TextStyle(
                              color:Colors.black, fontSize: 20))
                ],
              ),
              SizedBox(height: 20,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(width: 10,),

              //     Center(
              //         child: Text("Balance",
              //             style: TextStyle(
              //                 color:Colors.black, fontSize: 25))),
              //     SizedBox(
              //       width:2,
              //     ),
              //     Text(
              //       ":",
              //       style: TextStyle(fontSize: 25,color:Colors.black),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            margin: EdgeInsets.only(top: 20, left: 50),
            child: Text(
              "View All ",
              style: TextStyle(
                  color:Colors.black, fontSize: 20),
            )),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: ls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.only(bottom: 10, top: 10, left: 50, right: 50),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[50],
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.green)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ls[index]["food"],
                            style: TextStyle(
                                color:Colors.black,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            ls[index]["paid"],
                            style: TextStyle(
                                color:Colors.black,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        children: [
                          Text("Date",style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 18), ),
                                    SizedBox(height: 5,),
                          Text(ls[index]["date"], style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 17), ),
                        ],
                      ),
                      SizedBox(width: 45,),
                                Column(
                                  children: [
                                    Text("Time", style: TextStyle(
                                color:Colors.black,
                                fontSize: 15), ),
                                    SizedBox(height: 5,),
                                    Text(ls[index]["time"], style: TextStyle(
                                color:Colors.black,
                                fontSize: 15), ),
                                  ],
                                ),
                      SizedBox(width:25,),
                                Text("₹",style: TextStyle(fontSize: 20,color:Colors.black,),),
                                Text(ls[index]["money"], style: TextStyle(
                               color:Colors.black,
                                fontSize: 20), ),
                    ],
                  ),
                );
              }),
        )
      ]),
      drawer: Drawer(
        backgroundColor: Colors.green[100],
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "EXPENSE TRACKER",
                  style:
                      TextStyle(color:Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 130,
              margin: EdgeInsets.only(left: 50, right: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                 boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
            
                color:Colors.green[800]
              ),
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor:
                            Colors.green[100],
                          title: Text(
                            "ADD INCOME",
                            style: TextStyle(
                                color:Colors.black),
                          ),
                          content: Container(
                            width: 250,
                            height: 50,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                               boxShadow: [BoxShadow(blurRadius: 5,color: Colors.green)],
                              color: Colors.green[50]
                            ),
                            child: TextField(
                              controller: income,
                              decoration: InputDecoration(
                                  hintText: "Add Income",
                                  hintStyle: TextStyle(
                                    color:Colors.black
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          actions: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.white),
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
                                      onPressed: addIncome,
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color:Colors.white),
                                      )),
                                )
                              ],
                            )
                          ],
                        );
                      });
                },
                child: Text(
                  "ADD INCOME",
                  style: TextStyle(
                     color:Colors.white),
                ),
              ),
            ),
            Container(
               height: 50,
              width: 130,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[800]),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "track3");
                  },
                  child: Text(
                    "STATEMENTS",
                    style: TextStyle(
                        color:Colors.white),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.pushNamed(context, "track2");

      },child: Icon(Icons.add),),
    );
  }
}