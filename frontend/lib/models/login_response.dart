// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String name;
  final String userType;
  final String email;
  final List<dynamic> savedRecipes;
  final List<dynamic> favoriteRecipes;
  final String userToken;

  LoginResponse({
    required this.id,
    required this.name,
    required this.userType,
    required this.email,
    required this.savedRecipes,
    required this.favoriteRecipes,
    required this.userToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        name: json["name"],
        userType: json["userType"],
        email: json["email"],
        savedRecipes: List<dynamic>.from(json["savedRecipes"].map((x) => x)),
        favoriteRecipes:
            List<dynamic>.from(json["favoriteRecipes"].map((x) => x)),
        userToken: json["userToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "userType": userType,
        "email": email,
        "savedRecipes": List<dynamic>.from(savedRecipes.map((x) => x)),
        "favoriteRecipes": List<dynamic>.from(favoriteRecipes.map((x) => x)),
        "userToken": userToken,
      };
}
