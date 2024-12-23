import 'package:flutter/material.dart';
import 'package:frontend/app.dart';
import 'package:frontend/providers/category_provider.dart';
import 'package:frontend/providers/login_provider.dart';
import 'package:frontend/providers/navigation_provider.dart';
import 'package:frontend/providers/recipe_provider.dart';
import 'package:frontend/providers/register_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => NavigationProvider()),
    ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ChangeNotifierProvider(create: (context) => RecipeProvider()),
    ChangeNotifierProvider(create: (context) => RegisterProvider()),
    ChangeNotifierProvider(create: (context) => LoginProvider()),
  ], child: const App()));
}
