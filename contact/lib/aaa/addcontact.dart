import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  void pickImage() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedfile!.path);
    });
  }

  Future<void> add() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString("contacts");
    final bytes = await _image!.readAsBytes();
    final base64Image = base64Encode(bytes);
    if (res != null) {
      List<dynamic> contacts = json.decode(res);
      contacts.add({
        "Fname": Fname.text,
        "Lname": Lname.text,
        "email": email.text,
        "phone": phone.text,
        "profile": base64Image
      });
      prefs.setString("contacts", jsonEncode(contacts));   
      Navigator.pushNamed(context, '/');
    } else {
      List<dynamic> contacts = [
        {
          "Fname": Fname.text,
          "Lname": Lname.text,
          "email": email.text,
          "phone": phone.text,
          "profile": base64Image
        }
      ];
      prefs.setString("contacts", jsonEncode(contacts));
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("Add Contact")),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          
          children: [
            Center(
              child: ClipOval(
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            "No image",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
              ),
            ),
            TextButton(
              onPressed: pickImage,
              child: Text("Pick Image"),
            ),
            // Divider(),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: Fname,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Fname",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: Lname,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Lname",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: add,
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),



              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 225, 187, 236),
               
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}