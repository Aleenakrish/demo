import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr/numberlistprovider.dart';
import 'package:providerr/setstate1.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context)=>Numberlistprovider(),
    // child: Setstate1(),
    )
    );
}