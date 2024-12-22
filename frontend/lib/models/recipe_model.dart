// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
    final String id;
    final String title;
    final String description;
    final double rating;
    final int reviews;
    final List<Ingredient> ingredients;
    final List<Step> steps;
    final Category category;
    final int calorie;
    final String image;
    final String time;

    RecipeModel({
        required this.id,
        required this.title,
        required this.description,
        required this.rating,
        required this.reviews,
        required this.ingredients,
        required this.steps,
        required this.category,
        required this.calorie,
        required this.image,
        required this.time,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        reviews: json["reviews"],
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        category: Category.fromJson(json["category"]),
        calorie: json["calorie"],
        image: json["image"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "rating": rating,
        "reviews": reviews,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "category": category.toJson(),
        "calorie": calorie,
        "image": image,
        "time": time,
    };
}

class Category {
    final String id;
    final String title;
    final String value;
    final String image;

    Category({
        required this.id,
        required this.title,
        required this.value,
        required this.image,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "value": value,
        "image": image,
    };
}

class Ingredient {
    final String name;
    final String image;
    final String amount;
    final String id;

    Ingredient({
        required this.name,
        required this.image,
        required this.amount,
        required this.id,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        image: json["image"],
        amount: json["amount"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "amount": amount,
        "_id": id,
    };
}

class Step {
    final int stepNumber;
    final String instruction;
    final String image;
    final String id;

    Step({
        required this.stepNumber,
        required this.instruction,
        required this.image,
        required this.id,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        stepNumber: json["stepNumber"],
        instruction: json["instruction"],
        image: json["image"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "stepNumber": stepNumber,
        "instruction": instruction,
        "image": image,
        "_id": id,
    };
}
