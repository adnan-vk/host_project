import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentindex = 0;
  void change(int index) {
    currentindex = index;
    notifyListeners();
  }
}
