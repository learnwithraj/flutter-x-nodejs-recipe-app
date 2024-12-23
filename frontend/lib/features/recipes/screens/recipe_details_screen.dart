// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:frontend/models/recipe_model.dart';

// class RecipeDetailsScreen extends StatefulWidget {
//   const RecipeDetailsScreen({super.key, required this.recipe});

//   final RecipeModel recipe;

//   @override
//   State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
// }

// class _RecipeDetailsScreenState extends State<RecipeDetailsScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.recipe.title}'),
//         surfaceTintColor: Colors.white,
//         backgroundColor: Colors.transparent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image Section
//             Image.network(
//               widget.recipe.image,
//               height: 250,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),

//             // Recipe details
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title and Reviews
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "${widget.recipe.title}",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               RatingBarIndicator(
//                                 rating: widget.recipe.rating,
//                                 itemBuilder: (context, index) => Icon(
//                                   Icons.star,
//                                   color: Colors.amber,
//                                 ),
//                                 itemCount: 5,
//                                 itemSize: 12.0,
//                                 direction: Axis.horizontal,
//                               ),
//                               SizedBox(width: 8),
//                               Text('${widget.recipe.reviews} Reviews',
//                                   style: TextStyle(color: Colors.grey)),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // Time, Calories, and Serves
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _InfoColumn(
//                           icon: Icons.access_time,
//                           label: '${widget.recipe.time}'),
//                       _InfoColumn(
//                           icon: Icons.local_fire_department,
//                           label: '${widget.recipe.calorie} cal.'),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // Description
//                   Text(
//                     '${widget.recipe.description}',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 16),

//                   // Divider
//                   const Divider(),
//                 ],
//               ),
//             ),

//             // TabBar
//             Container(
//               color: Colors.white,
//               child: TabBar(
//                 controller: _tabController,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 indicatorColor: Colors.orange,
//                 tabs: const [
//                   Tab(text: 'Ingredients'),
//                   Tab(text: 'Directions'),
//                 ],
//               ),
//             ),

//             // TabBarView content
//             SizedBox(
//               height: 500,
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   // Ingredients Tab
//                   ListView.builder(
//                     shrinkWrap: true,
//                     // physics: NeverScrollableScrollPhysics(),
//                     itemCount: widget.recipe.ingredients.length,
//                     padding: const EdgeInsets.all(16),
//                     itemBuilder: (context, index) {
//                       var data = widget.recipe.ingredients[index];
//                       return ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(data.image),
//                         ),
//                         title: Text(
//                           data.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(data.amount),
//                       );
//                     },
//                   ),

//                   // Directions Tab
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: widget.recipe.steps.length,
//                     itemBuilder: (context, index) {
//                       var data = widget.recipe.steps[index];
//                       return ListTile(
//                         leading: Text(
//                           data.stepNumber.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30,
//                           ),
//                         ),
//                         title: Text(
//                           data.instruction,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: data.image != null
//                             ? Image.network(data.image)
//                             : null,
//                       );
//                     },
//                     // physics: NeverScrollableScrollPhysics(),
//                     padding: const EdgeInsets.all(16),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget for time, calories, and serves
// class _InfoColumn extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _InfoColumn({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon, size: 28, color: Colors.orange),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/models/recipe_model.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 200 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      title: AnimatedOpacity(
        opacity: _showTitle ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Text(
          widget.recipe.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.recipe.image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildMetrics(),
        _buildDescription(),
        _buildTabs(),
        _buildTabContent(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.recipe.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingBarIndicator(
                rating: widget.recipe.rating,
                itemBuilder: (_, __) =>
                    const Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 18,
                unratedColor: Colors.amber.withOpacity(0.3),
              ),
              const SizedBox(width: 8),
              Text(
                '(${widget.recipe.reviews} Reviews)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetrics() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMetricItem(Icons.access_time, widget.recipe.time, 'Time'),
          _buildMetricItem(
            Icons.local_fire_department,
            '${widget.recipe.calorie} cal',
            'Calories',
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        widget.recipe.description,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: KConstants.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.orange,
        indicatorWeight: 3,
        tabs: const [
          Tab(text: 'Ingredients'),
          Tab(text: 'Directions'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return SizedBox(
      height: 500,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildIngredientsTab(),
          _buildDirectionsTab(),
        ],
      ),
    );
  }

  Widget _buildIngredientsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.recipe.ingredients.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final ingredient = widget.recipe.ingredients[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(ingredient.image),
            backgroundColor: Colors.grey[200],
          ),
          title: Text(
            ingredient.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            ingredient.amount,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDirectionsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.recipe.steps.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final step = widget.recipe.steps[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    step.stepNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    step.instruction,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                step.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
          ],
        );
      },
    );
  }
}
