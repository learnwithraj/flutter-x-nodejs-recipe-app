// // import 'package:flutter/material.dart';
// // import 'package:frontend/constants/constants.dart';
// // import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
// // import 'package:frontend/features/recipes/widgets/ingredient_card.dart';
// // import 'package:frontend/models/recipe_model.dart';
// // import 'package:frontend/providers/recipe_provider.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:provider/provider.dart';

// // class IngredientSection extends StatelessWidget {
// //   const IngredientSection({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final recipeProvider = Provider.of<RecipeProvider>(context);
// //     return Container(
// //       child: Column(
// //         children: [
// //           SizedBox(height: 10),
// //           TextField(
// //             decoration: InputDecoration(
// //               contentPadding: EdgeInsets.all(4),
// //               hintText: "Search",
// //               hintStyle: TextStyle(color: KConstants.textColor),
// //               prefixIcon: Icon(Iconsax.search_normal),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8),
// //                 borderSide: BorderSide.none,
// //               ),
// //               filled: true,
// //               fillColor: KConstants.secondary,
// //             ),
// //           ),
// //           SizedBox(height: 15),
// //           SizedBox(
// //             height: 40,
// //             child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: recipeProvider.ingredients!.length,
// //                 itemBuilder: (context, index) {
// //                   var ingredient = recipeProvider.ingredients![index];
// //                   return GestureDetector(
// //                     onTap: () {},
// //                     child: Container(
// //                       margin: EdgeInsets.only(right: 10),
// //                       padding: EdgeInsets.all(10),
// //                       decoration: BoxDecoration(
// //                         color: KConstants.secondary,
// //                         borderRadius: BorderRadius.circular(30),
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           ingredient.name,
// //                           style: TextStyle(
// //                             color: KConstants.textColor,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 }),
// //           ),
// //           SizedBox(height: 15),
// //           Expanded(
// //             child: GridView.builder(
// //                 // physics: BouncingScrollPhysics(),
// //                 itemCount: recipeProvider.ingredients!.length,
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 10,
// //                   mainAxisSpacing: 10,
// //                   mainAxisExtent: 190,
// //                 ),
// //                 itemBuilder: (context, index) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       recipeProvider.fetchIngredientsWithRecipe(
// //                           recipeProvider.ingredients![index].name);
// //                       RecipeModel recipe =
// //                           recipeProvider.ingredientsRecipe![index];
// //                       Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) =>
// //                                   RecipeDetailsScreen(recipe: recipe)));
// //                     },
// //                     child: IngredientCard(
// //                         ingredients: recipeProvider.ingredients![index]),
// //                   );
// //                 }),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:frontend/constants/constants.dart';
// // import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
// // import 'package:frontend/features/recipes/widgets/ingredient_card.dart';
// // import 'package:frontend/models/recipe_model.dart';
// // import 'package:frontend/providers/recipe_provider.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:provider/provider.dart';

// // class IngredientSection extends StatelessWidget {
// //   const IngredientSection({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final recipeProvider = Provider.of<RecipeProvider>(context);

// //     return Container(
// //       child: Column(
// //         children: [
// //           SizedBox(height: 10),
// //           TextField(
// //             decoration: InputDecoration(
// //               contentPadding: EdgeInsets.all(4),
// //               hintText: "Search",
// //               hintStyle: TextStyle(color: KConstants.textColor),
// //               prefixIcon: Icon(Iconsax.search_normal),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8),
// //                 borderSide: BorderSide.none,
// //               ),
// //               filled: true,
// //               fillColor: KConstants.secondary,
// //             ),
// //           ),
// //           SizedBox(height: 15),
// //           SizedBox(
// //             height: 40,
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: recipeProvider.ingredients!.length,
// //               itemBuilder: (context, index) {
// //                 var ingredient = recipeProvider.ingredients![index];
// //                 return GestureDetector(
// //                   onTap: () {
// //                     recipeProvider.fetchIngredientsWithRecipe(ingredient.name);
// //                   },
// //                   child: Container(
// //                     margin: EdgeInsets.only(right: 10),
// //                     padding: EdgeInsets.all(10),
// //                     decoration: BoxDecoration(
// //                       color: KConstants.secondary,
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         ingredient.name,
// //                         style: TextStyle(
// //                           color: KConstants.textColor,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           SizedBox(height: 15),
// //           Expanded(
// //             child: Consumer<RecipeProvider>(
// //               builder: (context, provider, child) {
// //                 if (provider.isLoading) {
// //                   return Center(child: CircularProgressIndicator());
// //                 }

// //                 if (provider.ingredientsRecipe == null ||
// //                     provider.ingredientsRecipe!.isEmpty) {
// //                   return Center(child: Text("No recipes found."));
// //                 }

// //                 return GridView.builder(
// //                   itemCount: provider.ingredientsRecipe!.length,
// //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 2,
// //                     crossAxisSpacing: 10,
// //                     mainAxisSpacing: 10,
// //                     mainAxisExtent: 190,
// //                   ),
// //                   itemBuilder: (context, index) {
// //                     RecipeModel recipe = provider.ingredientsRecipe![index];

// //                     return GestureDetector(
// //                       onTap: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) =>
// //                                 RecipeDetailsScreen(recipe: recipe),
// //                           ),
// //                         );
// //                       },
// //                       child: IngredientCard(
// //                           ingredients: recipeProvider.ingredients![index]),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:frontend/constants/constants.dart';
// // import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
// // import 'package:frontend/features/recipes/widgets/ingredient_card.dart';
// // import 'package:frontend/providers/recipe_provider.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:provider/provider.dart';

// // class IngredientSection extends StatelessWidget {
// //   const IngredientSection({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final recipeProvider = Provider.of<RecipeProvider>(context);

// //     return Container(
// //       child: Column(
// //         children: [
// //           SizedBox(height: 10),
// //           // Search Field
// //           TextField(
// //             decoration: InputDecoration(
// //               contentPadding: EdgeInsets.all(4),
// //               hintText: "Search",
// //               hintStyle: TextStyle(color: KConstants.textColor),
// //               prefixIcon: Icon(Iconsax.search_normal),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8),
// //                 borderSide: BorderSide.none,
// //               ),
// //               filled: true,
// //               fillColor: KConstants.secondary,
// //             ),
// //           ),
// //           SizedBox(height: 15),

// //           // Ingredient Chips (Horizontal Scroll)
// //           SizedBox(
// //             height: 40,
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: recipeProvider.ingredients!.length,
// //               itemBuilder: (context, index) {
// //                 var ingredient = recipeProvider.ingredients![index];
// //                 return GestureDetector(
// //                   onTap: () async {
// //                     await recipeProvider
// //                         .fetchIngredientsWithRecipe(ingredient.name);
// //                   },
// //                   child: Container(
// //                     margin: EdgeInsets.only(right: 10),
// //                     padding: EdgeInsets.all(10),
// //                     decoration: BoxDecoration(
// //                       color: KConstants.secondary,
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         ingredient.name,
// //                         style: TextStyle(
// //                           color: KConstants.textColor,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           SizedBox(height: 15),

// //           // Grid of Ingredients
// //           Expanded(
// //             child: GridView.builder(
// //               itemCount: recipeProvider.ingredients!.length,
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 crossAxisSpacing: 10,
// //                 mainAxisSpacing: 10,
// //                 mainAxisExtent: 190,
// //               ),
// //               itemBuilder: (context, index) {
// //                 var ingredient = recipeProvider.ingredients![index];

// //                 return GestureDetector(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => RecipeDetailsScreen(
// //                           recipe: recipeProvider.ingredientsRecipe![index],
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: IngredientCard(ingredients: ingredient),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:frontend/constants/constants.dart';
// import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
// import 'package:frontend/features/recipes/widgets/ingredient_card.dart';
// import 'package:frontend/models/recipe_model.dart';
// import 'package:frontend/providers/recipe_provider.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:provider/provider.dart';

// class IngredientSection extends StatelessWidget {
//   const IngredientSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final recipeProvider = Provider.of<RecipeProvider>(context);

//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           // Search Field
//           TextField(
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(4),
//               hintText: "Search",
//               hintStyle: TextStyle(color: KConstants.textColor),
//               prefixIcon: Icon(Iconsax.search_normal),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: KConstants.secondary,
//             ),
//           ),
//           SizedBox(height: 15),

//           // Ingredient Chips (Horizontal Scroll)
//           SizedBox(
//             height: 40,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: recipeProvider.ingredients!.length,
//               itemBuilder: (context, index) {
//                 var ingredient = recipeProvider.ingredients![index];
//                 return GestureDetector(
//                   onTap: () async {
//                     await recipeProvider
//                         .fetchIngredientsWithRecipe(ingredient.name);
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(right: 10),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: KConstants.secondary,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Center(
//                       child: Text(
//                         ingredient.name,
//                         style: TextStyle(
//                           color: KConstants.textColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 15),

//           // Grid of Ingredients
//           Expanded(
//             child: GridView.builder(
//               itemCount: recipeProvider.ingredients!.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 mainAxisExtent: 190,
//               ),
//               itemBuilder: (context, index) {
//                 var ingredient = recipeProvider.ingredients![index];

//                 return GestureDetector(
//                  onTap: () async {
//   try {
//     // Fetch recipes associated with the ingredient
//     await recipeProvider.fetchIngredientsWithRecipe(ingredient.name);

//     // Find the first recipe that matches the ingredient
//     RecipeModel? recipe = recipeProvider.ingredientsRecipe?.firstWhere(
//       (r) => r.ingredients == ingredient.name,
//       orElse: () => RecipeModel(), // Return a default RecipeModel if no match is found
//     );

//     if (recipe != null) {
//       // Navigate to RecipeDetailsScreen if a recipe is found
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => RecipeDetailsScreen(recipe: recipe),
//         ),
//       );
//     } else {
//       // Show a message if no recipe is found
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No recipes found for this ingredient.')),
//       );
//     }
//   } catch (e) {
//     // Handle unexpected errors
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('An error occurred. Please try again later.')),
//     );
//     debugPrint('Error fetching recipes: $e');
//   }
// },

//                   child: IngredientCard(ingredients: ingredient),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
