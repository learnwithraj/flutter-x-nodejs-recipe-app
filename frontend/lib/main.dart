import 'package:flutter/material.dart';
import 'package:frontend/app.dart';
import 'package:frontend/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
    )
  ], child: const App()));
}
