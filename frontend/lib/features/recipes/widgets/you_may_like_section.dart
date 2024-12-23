// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:frontend/constants/constants.dart';
// import 'package:frontend/features/recipes/widgets/section_title.dart';
// import 'package:frontend/providers/recipe_provider.dart';
// import 'package:provider/provider.dart';

// class YouMayLikeSection extends StatelessWidget {
//   const YouMayLikeSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final recipeProvider = Provider.of<RecipeProvider>(context);
//     return Container(
//       height: 255,
//       padding: EdgeInsets.all(8),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(
//             text: 'You May Like',
//             isViewAll: true,
//           ),
//           SizedBox(height: 10),
//           //trending recipes here
//           Expanded(
//             child: ListView.builder(
//                 itemCount: recipeProvider.popularRecipes?.length ?? 0,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   var recipe = recipeProvider.popularRecipes![index];
//                   return Container(
//                     margin: EdgeInsets.only(right: 10),
//                     width: 150,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 150,
//                           width: 150,
//                           child: Image.network(recipe.image),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           recipe.title,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: KConstants.textColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             RatingBarIndicator(
//                               rating: recipe.rating,
//                               itemBuilder: (context, index) => Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                               ),
//                               itemCount: 5,
//                               itemSize: 13.0,
//                               direction: Axis.horizontal,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               "(${recipe.reviews})",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
import 'package:frontend/features/recipes/widgets/section_title.dart';
import 'package:frontend/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class YouMayLikeSection extends StatelessWidget {
  const YouMayLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Container(
      height: 360,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(text: 'You May Like', isViewAll: false),
                  Text(
                    'Recipes picked for you',
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
              itemCount: recipeProvider.popularRecipes?.length ?? 0,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var recipe = recipeProvider.popularRecipes![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe)));
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Container
                        Container(
                          height: 180,
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
                                      child: Icon(Icons.restaurant,
                                          size: 40, color: Colors.grey[400]),
                                    );
                                  },
                                ),
                              ),
                              // Time Overlay
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.schedule,
                                        size: 16,
                                        color: KConstants.textColor,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        recipe.time,
                                        style: TextStyle(
                                          color: KConstants.textColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        // Recipe Title
                        Text(
                          recipe.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: KConstants.textColor,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Rating and Reviews
                        Row(
                          children: [
                            Container(
                              height: 20,
                              child: RatingBarIndicator(
                                rating: recipe.rating,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 16.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "(${recipe.reviews})",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Recipe Stats
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
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
