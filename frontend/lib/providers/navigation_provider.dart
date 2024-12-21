import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  var selectedIndex = 0;
  final screens = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.pink,
    ),
  ];

  void onTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
