import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
import 'package:frontend/models/category_model.dart';
import 'package:frontend/providers/category_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/recipe_provider.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late RecipeProvider recipeProvider;
  late CategoryProvider categoryProvider;

  @override
  void initState() {
    super.initState();

    // Fetch recipes in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
      categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

      if (recipeProvider.recipes == null) {
        recipeProvider.fetchRecipesByCategory(categoryProvider.categoryValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    recipeProvider = Provider.of<RecipeProvider>(context);
    categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      body: recipeProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : recipeProvider.recipes!.isEmpty || recipeProvider.recipes == null
              ? Center(
                  child: Text("No recipes yet"),
                )
              : CustomScrollView(
                  slivers: [
                    // SliverAppBar
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 250.0,
                      pinned: true,
                      flexibleSpace: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final showTitle =
                              constraints.biggest.height <= kToolbarHeight + 50;

                          return FlexibleSpaceBar(
                            title: showTitle
                                ? Text(
                                    '${categoryProvider.titleValue}',
                                    style: TextStyle(fontSize: 18),
                                  )
                                : null,
                            centerTitle: true,
                            background: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  widget.category.image,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black87,
                                        Colors.transparent,
                                        Colors.black87,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(widget.category.image),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${categoryProvider.titleValue}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black),
                          onPressed: () {
                            // Add search functionality
                          },
                        ),
                      ],
                    ),
                    // Sliver for Recipe Count and Filter
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${recipeProvider.recipes?.length ?? 0} Recipes',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.sort, color: Colors.black),
                              onPressed: () {
                                // Add filter/sort functionality
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SliverList for Recipes
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final recipe = recipeProvider.recipes![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailsScreen(recipe: recipe),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      recipe.image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${recipe.title}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                rating: recipe.rating,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 12.0,
                                                direction: Axis.horizontal,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '${recipe.reviews} Reviews',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Icon(Icons.access_time, size: 14),
                                              SizedBox(width: 4),
                                              Text(
                                                '${recipe.time}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(width: 16),
                                              Icon(Icons.check_circle,
                                                  size: 14,
                                                  color: Colors.green),
                                              SizedBox(width: 4),
                                              Text(
                                                'Vegetarian',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
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
                          );
                        },
                        childCount: recipeProvider.recipes?.length ?? 0,
                      ),
                    ),
                  ],
                ),
    );
  }
}
