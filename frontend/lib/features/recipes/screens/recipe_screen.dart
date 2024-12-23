import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/features/recipes/screens/recipe_details_screen.dart';
import 'package:frontend/models/category_model.dart';
import 'package:frontend/providers/category_provider.dart';
import 'package:provider/provider.dart';
import '../../../providers/recipe_provider.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with SingleTickerProviderStateMixin {
  late RecipeProvider recipeProvider;
  late CategoryProvider categoryProvider;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeProviders();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  void _initializeProviders() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
      categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

      if (recipeProvider.recipes == null) {
        recipeProvider.fetchRecipesByCategory(categoryProvider.categoryValue);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    recipeProvider = Provider.of<RecipeProvider>(context);
    categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (recipeProvider.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: KConstants.primary),
            const SizedBox(height: 16),
            Text(
              'Loading delicious recipes...',
              style: TextStyle(
                  color: KConstants.primary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    if (recipeProvider.recipes == null || recipeProvider.recipes!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              "No recipes available yet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              "Check back later for new recipes",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildSliverAppBar(),
        _buildRecipeCount(),
        _buildRecipeList(),
      ],
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 280.0,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final showTitle = constraints.biggest.height <= kToolbarHeight + 50;
          return FlexibleSpaceBar(
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: showTitle ? 1.0 : 0.0,
              child: Text(
                categoryProvider.titleValue,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'category_${widget.category.id}',
                  child: Image.network(
                    widget.category.image,
                    fit: BoxFit.cover,
                  ),
                ),
                _buildGradientOverlay(),
                _buildCategoryInfo(),
              ],
            ),
          );
        },
      ),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryInfo() {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.category.image),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            categoryProvider.titleValue,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCount() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${recipeProvider.recipes?.length ?? 0} Recipes',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recipe = recipeProvider.recipes![index];
          return FadeTransition(
            opacity: _fadeAnimation,
            child: _buildRecipeCard(recipe),
          );
        },
        childCount: recipeProvider.recipes?.length ?? 0,
      ),
    );
  }

  Widget _buildRecipeCard(dynamic recipe) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailsScreen(recipe: recipe),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: recipe.id,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(16)),
                child: Image.network(
                  recipe.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: recipe.rating,
                          itemBuilder: (_, __) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16,
                          unratedColor: Colors.amber.withOpacity(0.3),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${recipe.reviews})',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(
                          Icons.access_time,
                          recipe.time,
                          Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        _buildInfoChip(
                          Icons.local_fire_department,
                          '${recipe.calorie} cal',
                          Colors.orange,
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
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
