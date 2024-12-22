import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/models/api_error.dart';
import 'package:frontend/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  String _category = "";
  String get categoryValue => _category;

  set updateCategory(String value) {
    _category = value;
    notifyListeners();
  }

  String _title = "";
  String get titleValue => _title;

  set updateTitle(String value) {
    _title = value;
    notifyListeners();
  }

  List<CategoryModel>? _categories;
  bool _isLoading = false;
  ApiError? _error;

  // Getters
  List<CategoryModel>? get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error?.message;
  CategoryProvider() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse("$kAppBaseUrl/api/categories/"));

      if (response.statusCode == 200) {
        _categories = categoryModelFromJson(response.body);
        _error = null; // No error
      } else {
        _error = ApiError(status: false, message: "Failed to load categories.");
        _categories = [];
      }
    } catch (e) {
      _error = ApiError(status: false, message: e.toString());
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI of state change
    }
  }

  // Method to refresh categories if needed
  Future<void> refetchCategories() async {
    await fetchCategories();
  }
}
