// To parse this JSON data, do
//
//     final ingredientsModel = ingredientsModelFromJson(jsonString);

import 'dart:convert';

List<IngredientsModel> ingredientsModelFromJson(String str) => List<IngredientsModel>.from(json.decode(str).map((x) => IngredientsModel.fromJson(x)));

String ingredientsModelToJson(List<IngredientsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IngredientsModel {
    final String name;
    final String amount;
    final String image;

    IngredientsModel({
        required this.name,
        required this.amount,
        required this.image,
    });

    factory IngredientsModel.fromJson(Map<String, dynamic> json) => IngredientsModel(
        name: json["name"],
        amount: json["amount"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "image": image,
    };
}
