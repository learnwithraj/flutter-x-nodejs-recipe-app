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
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 10, horizontal: 5), // Add spacing around the card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[200]!], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity, // Full width for the image
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  category.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: KConstants.textColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Handles overflow gracefully
              ),
            ),
          ],
        ),
      ),
    );
  }
}
