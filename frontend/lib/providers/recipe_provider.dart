import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/models/api_error.dart';
import 'package:frontend/models/ingredients_model.dart';
import 'package:frontend/models/recipe_model.dart'; // Make sure to import the RecipeModel
import 'package:http/http.dart' as http;

class RecipeProvider with ChangeNotifier {
  List<RecipeModel>? _recipes; // List to store recipes
  bool _isLoading = false;
  ApiError? _error;

  // Getters
  List<RecipeModel>? get recipes => _recipes; // Getter for recipes
  bool get isLoading => _isLoading;
  String? get error => _error?.message;

  void clearRecipes() {
    _recipes = [];
    notifyListeners();
  }

  RecipeProvider() {
    fetchIngredients();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchRecipesByCategory(String categoryId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse("$kAppBaseUrl/api/recipes/category/$categoryId"));

      if (response.statusCode == 200) {
        _recipes = recipeModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error = ApiError(status: false, message: "Failed to load recipes.");
        _recipes = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _recipes = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  List<IngredientsModel>? _ingredients;

  // Getters
  List<IngredientsModel>? get ingredients => _ingredients;

  void clearIngredients() {
    _ingredients = [];
    notifyListeners();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchIngredients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse("$kAppBaseUrl/api/recipes/ingredients/all"));

      if (response.statusCode == 200) {
        _ingredients = ingredientsModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error =
            ApiError(status: false, message: "Failed to load ingredients.");
        _ingredients = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _ingredients = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  // // Method to refresh categories if needed
  // Future<void> refetchRecipes() async {
  //   await fetchRecipesByCategory();
  // }
}
