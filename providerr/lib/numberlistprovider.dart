import 'package:flutter/material.dart';

class Numberlistprovider extends ChangeNotifier {
  List<int> numbers= [1,2,3,4,5];

  void addNumbers(){
    numbers.add(numbers.last + 1);
    notifyListeners();
  }
}