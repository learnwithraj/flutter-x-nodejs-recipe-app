import 'package:flutter/material.dart';
import 'package:frontend/features/auth/screens/account.dart';
import 'package:frontend/features/recipes/screens/home.dart';
import 'package:frontend/features/recipes/screens/inspiration_screen.dart';

class NavigationProvider with ChangeNotifier {
  var selectedIndex = 0;
  final screens = [
    HomeScreen(),
    InspirationScreen(),
    AccountScreen(),
  ];

  void onTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
