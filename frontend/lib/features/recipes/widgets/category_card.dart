import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/screens/recipe_screen.dart';
import 'package:frontend/models/category_model.dart';
import 'package:frontend/providers/category_provider.dart';
import 'package:frontend/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
     final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        if (categoryProvider.categoryValue == category.id) {
          categoryProvider.updateCategory = '';
          categoryProvider.updateTitle = '';
           recipeProvider.clearRecipes();
        } else {
          categoryProvider.updateCategory = category.id;
          categoryProvider.updateTitle = category.title;
           recipeProvider.clearRecipes();
          // Fetch recipes for the selected category
          recipeProvider.fetchRecipesByCategory(category.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeScreen(category: category)));
          // Navigator.pushNamed(context, "/categoryFoodsScreen");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.network(fit: BoxFit.cover, "${category.image}"),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: KConstants.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
