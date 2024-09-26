import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayContact extends StatefulWidget {
  const DisplayContact({super.key});

  @override
  State<DisplayContact> createState() => _DisplayContactState();
}

class _DisplayContactState extends State<DisplayContact> {
  Uint8List? _image;
  int? index;
  List<dynamic>? _contacts;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString("contacts");
    setState(() {
      _contacts = jsonDecode(res!);
      _image = base64Decode(_contacts![index!].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    index = int.parse(ModalRoute.of(context)!.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Contact"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [SizedBox(height: 60,),
            ClipOval(
              child: _image != null
                  ? Image.memory(
                      _image!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          "No image",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
            ),
            // Divider(),
            Row(
              children: [SizedBox(height: 100,),
               
              Padding(padding: EdgeInsets.only(left: 50,right: 100)),
                Text("Name",style: TextStyle(fontSize: 20),),

                Text(_contacts![index!].toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}