import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/screens/home.dart';
import 'package:frontend/features/recipes/screens/inspiration_screen.dart';

class NavigationProvider with ChangeNotifier {
  var selectedIndex = 0;
  final screens = [
    HomeScreen(),
    InspirationScreen(),
    Container(
      color: Colors.pink,
    ),
  ];

  void onTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
