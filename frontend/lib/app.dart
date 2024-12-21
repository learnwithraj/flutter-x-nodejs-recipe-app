import 'package:flutter/material.dart';
import 'package:frontend/navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const NavigationMenu(),
    );
  }
}
