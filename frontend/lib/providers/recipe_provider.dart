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
    fetchPopularRecipes();
    fetchTrendingRecipes();
    fetchChefChoiceRecipes();
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

  List<RecipeModel>? _popularRecipes;

  // Getters
  List<RecipeModel>? get popularRecipes => _popularRecipes;

  void clearPopularRecipes() {
    _ingredients = [];
    notifyListeners();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchPopularRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse("$kAppBaseUrl/api/recipes/popular/all"));

      if (response.statusCode == 200) {
        _popularRecipes = recipeModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error =
            ApiError(status: false, message: "Failed to load popular recipe.");
        _popularRecipes = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _popularRecipes = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  // // Method to refresh categories if needed
  // Future<void> refetchRecipes() async {
  //   await fetchRecipesByCategory();
  // }

  List<RecipeModel>? _trendingRecipes;

  // Getters
  List<RecipeModel>? get trendingRecipes => _trendingRecipes;

  void clearTrendingRecipes() {
    _ingredients = [];
    notifyListeners();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchTrendingRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse("$kAppBaseUrl/api/recipes/trending/all"));

      if (response.statusCode == 200) {
        _trendingRecipes = recipeModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error =
            ApiError(status: false, message: "Failed to load trending recipe.");
        _trendingRecipes = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _trendingRecipes = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  // // Method to refresh categories if needed
  // Future<void> refetchRecipes() async {
  //   await fetchRecipesByCategory();
  // }

  List<RecipeModel>? _chefChoiceRecipe;

  // Getters
  List<RecipeModel>? get chefChoiceRecipe => _chefChoiceRecipe;

  void clearChefChoiceRecipes() {
    _ingredients = [];
    notifyListeners();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchChefChoiceRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse("$kAppBaseUrl/api/recipes/chef-choice/all"));

      if (response.statusCode == 200) {
        _chefChoiceRecipe = recipeModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error = ApiError(
            status: false, message: "Failed to load chef choice recipe.");
        _chefChoiceRecipe = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _chefChoiceRecipe = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  // // Method to refresh categories if needed
  // Future<void> refetchRecipes() async {
  //   await fetchRecipesByCategory();
  // }

  List<RecipeModel>? _ingredientsRecipe;

  // Getters
  List<RecipeModel>? get ingredientsRecipe => _ingredientsRecipe;

  void clearIngredientsWithRecipe() {
    _ingredients = [];
    notifyListeners();
  }

  // New method to fetch recipes based on category ID
  Future<void> fetchIngredientsWithRecipe(String ingredient) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          "$kAppBaseUrl/api/recipes/ingredients/all/recipes/$ingredient"));

      if (response.statusCode == 200) {
        _ingredientsRecipe = recipeModelFromJson(
            response.body); // Assuming recipeModelFromJson is defined
        _error = null; // No error
      } else {
        _error = ApiError(
            status: false, message: "Failed to load ingredients with recipe.");
        _ingredientsRecipe = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _ingredientsRecipe = [];
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
