import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactHome extends StatefulWidget {
  const ContactHome({super.key});

  @override
  State<ContactHome> createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  List<dynamic> _contacts = [];
  @override
  void initState() {
    
    super.initState();
    add();
  }

  void add() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString("contacts");
    setState(() {
      _contacts = jsonDecode(res!);
      print(_contacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  
                  onTap: () {
                    Navigator.pushNamed(context, "/displaycontact",
                        arguments: index.toString());
                  },
                  // title: Text(_contacts[index]["Fname"]),
                  trailing: Icon(Icons.more_vert),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addcontact');
          // add();
          
        },
        child: Icon(Icons.add),
       
      ),
    );
  }
}