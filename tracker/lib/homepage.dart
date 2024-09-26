// import 'dart:io';

// import 'package:expencetracker/statementpage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController c1=TextEditingController();
  TextEditingController c2=TextEditingController();
  TextEditingController c3=TextEditingController();
  TextEditingController c4=TextEditingController();
  TextEditingController c5=TextEditingController();
  TextEditingController c6=TextEditingController();
  List<dynamic>ls=[];
  final _expance = Hive.box("mybox");


  void addData(){
  if(_expance.get("key")!=null){
    ls= _expance.get("key");

    ls.add({
      "NOTE":c1.text,
       "EXPENCE":c2.text,
        // "note":c1.text,

    });
    _expance.put("key", ls);
  }else{
    ls=[{
      "NOTE":c1.text,
       "EXPENCE":c2.text,
    }];
  }
}

  
  // var _image;

  // final ImagePicker _picker = ImagePicker();

  // void pickimage()async{
  //   final  PickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(PickedFile!.path);
  //   });

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        // iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text("EXPENCE TRACKER",style:TextStyle(color: Colors.black),),
          
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[100],

        child: ListView(children: [
          Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.green[800],
              padding: EdgeInsets.only(top: 10,left: 110),
              // child: Text(style: TextStyle(
              //   fontWeight: FontWeight.bold,fontSize: 18
              // ),),
            ),
          ),
          SizedBox(height: 50,),
          Row(
            children: [SizedBox(width: 80,),
               Container(
                  // padding: EdgeInsets.only(left: 50),
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                  ),
                  child: TextButton(onPressed: (){
                    showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[100],
            title: Text("ADD INCOME",
            style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 19

            ),),
            content: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: Colors.green)
                ]
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Add income",
                  
                border: InputBorder.none
                  
                ),
              ),
            ),
            actions: [
              Container(
                height: 100,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   
                    SizedBox(height: 10,),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.green)]
                      ),
                      child: TextButton(onPressed: (){
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: Container(
                              height: 300,
                              width: 390,
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      child: Text("INCOME",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                         ),
                                        ),
                                    ),
                                  )
                                ],

                              ),
                            ),

                          );
                        },);
                      },
                       child: Text("Save",
                       style: TextStyle(
                        color: Colors.black),
                        )
                        ),
                    ),
                    SizedBox(width: 20,),
                    
                    
                    Container(
                       height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.green)]
                      ),
                      child: TextButton(onPressed: (){
                         Navigator.pop(context);
                      },
                       child: Text("Cancel",
                       style: TextStyle(
                        color: Colors.black),
                       )
                       ),
                    )
                   
                    
                  ],
                ),
              )
            ],
          );
        },);
                  },
                   child: Text(" ADD INCOME",style: TextStyle(color: Colors.white),))
                ),
              
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [SizedBox(width: 80,),
               Container(
                  // padding: EdgeInsets.only(left: 50),
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                  ),
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, "statementpage");
                  },
                   child: Text("STATEMENTS",style: TextStyle(color: Colors.white),))
                ),
              
            ],

          )
          // DrawerHeader(
          //   child: MaterialButton(onPressed: (){},
          //   child: Text("add"),
          //   ))
        ],),
      ),
      body:Container(
        child: ListView(
          children: [SizedBox(width: 20,height: 20,),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50),
                  height: 250,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     color: Colors.green[50],
                     boxShadow: [BoxShadow(blurRadius: 6, color: Colors.green)]
                  ),
                
                 
                ),
                // GestureDetector(
                //   child: Text(ls[index]["note"]),
                // )
                // Expanded(child: ListView.builder(
                //   itemBuilder:(context,index){
                //     return Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color:Colors.amber
                //       ),
                //       child: Text(ls[index]["NOTE"]),
                //     );
                //   }

                // ))
                
              ],
            )
          ],


        ),
        

      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.green[800],
        // splashColor: Colors.black,
        onPressed: (){
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[100],
            actions: [
              Container(
                height: 270,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("NOTE   :",
                          style:TextStyle(
                            fontSize: 17

                          ) ,),
                        ),
                        // Spacer(),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            controller: c1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                
                              )
                            ),
                          )
                          )
                      ],
                    
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          child: Text("EXPENCE   :",
                          style:TextStyle(
                            fontSize: 17

                          ) ,),
                          
                        ),
                         SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            controller: c2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              )
                            ),
                          )
                          )

                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                         Container(
                          child: Text("BILL   :",
                          style:TextStyle(
                            fontSize: 17

                          ) ,),
                          
                        ),
                        SizedBox(width: 20,),
                        Container(
                          // padding: EdgeInsets.only(left: 20),
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[50],
                            boxShadow: [
                              BoxShadow()
                            ]
                          ),
                          child: TextButton(onPressed: (){
                            // pickimage();
                            // Container(
                            //   child: Center(
                            //     child: ClipRect(
                            //       child: _image !=null
                            //       ? Image.file(
                            //         _image!,
                            //         width: 100,
                            //         height: 30,
                            //         fit: BoxFit.cover,
                            //       ):
                            //       Container(
                            //          width: 100,
                            //         height: 30,
                                    
                            //       )
                            //     )
                            //   ),

                            // );
                          },
                           child: Icon(Icons.add,color: Colors.black,)),
                        )
                      ],

                    ),
                    
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[50],
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.green)
                              ]
                          ),
                          // padding: EdgeInsets.only(left: 10),
                          child: 
                        TextButton(onPressed: (){
                          addData();
                           Navigator.pushNamed(context, "homepage");
                          /////////////
                        }, 
                        child: Text("SAVE",style: TextStyle(
                          color: Colors.black,
                        ),)),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[50],
                            boxShadow: [
                              BoxShadow(blurRadius: 6, color: Colors.green)
                            ]
                          ),
                          // padding: EdgeInsets.only(left: 20),

                          child: TextButton(onPressed: (){
                            Navigator.pop(context);
                          },
                           child: Text("CANCEL",style: TextStyle(
                          color: Colors.black,
                          
                        ),
                        )
                        ),
                        )
                      ],

                    ),
                    
                  ],
                ),
              )
            ],
          );
        },
        );
      },
      child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}