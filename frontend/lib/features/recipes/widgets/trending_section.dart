// import 'package:flutter/material.dart';
// import 'package:frontend/features/recipes/widgets/section_title.dart';
// import 'package:frontend/providers/recipe_provider.dart';
// import 'package:provider/provider.dart';

// class TrendingSection extends StatelessWidget {
//   const TrendingSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final recipeProvider = Provider.of<RecipeProvider>(context);
//     return Container(
//       height: 225,
//       width: double.infinity,
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(
//             text: 'Trending',
//           ),
//           SizedBox(height: 10),
//           //trending recipes here
//           Expanded(
//             child: ListView.builder(
//                 itemCount: recipeProvider.trendingRecipes?.length ?? 0,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   var trendingRecipe = recipeProvider.trendingRecipes![index];
//                   return Column(
//                     children: [
//                       Container(
//                         height: 150,
//                         margin: EdgeInsets.only(right: 10),
//                         width: 150,
//                         child: Image.network(trendingRecipe.image),
//                       ),
//                       SizedBox(height: 5),
//                       Text(trendingRecipe.title),
//                     ],
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
import 'package:frontend/features/recipes/widgets/section_title.dart';
import 'package:frontend/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Container(
      height: 280,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(text: 'Trending'),
                  Text(
                    'Most popular recipes this week',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: recipeProvider.trendingRecipes?.length ?? 0,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var recipe = recipeProvider.trendingRecipes![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe)));
                  },
                  child: Container(
                    width: 180,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Container
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    recipe.image,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: Icon(
                                          Icons.restaurant,
                                          color: Colors.grey[400],
                                          size: 40,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Recipe Stats Overlay
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(16),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.schedule,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              recipe.time,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              recipe.rating.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Recipe Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department,
                                    size: 16,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${recipe.calorie} cal',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
