import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/widgets/home_app_bar.dart';
import 'package:frontend/features/recipes/widgets/ingredient_section.dart';

import '../widgets/category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), child: HomeAppBar()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TabBarView(
            children: [
              CategorySection(),
              IngredientSection(),
            ],
          ),
        ),
      ),
    );
  }
}
