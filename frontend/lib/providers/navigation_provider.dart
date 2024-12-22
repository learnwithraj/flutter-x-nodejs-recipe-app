import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/screens/home.dart';

class NavigationProvider with ChangeNotifier {
  var selectedIndex = 0;
  final screens = [
    HomeScreen(),
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
