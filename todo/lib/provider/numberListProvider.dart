import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier {
  List<dynamic> ls = [];

  void addList(task) {
    ls.add(task);
    notifyListeners();
  }
}
