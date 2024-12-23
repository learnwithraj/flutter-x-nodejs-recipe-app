import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/widgets/home_app_bar.dart';
import 'package:frontend/features/recipes/widgets/popular_section.dart';

import '../widgets/category_section.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//             preferredSize: Size.fromHeight(100), child: HomeAppBar()),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: TabBarView(
//             children: [
//               CategorySection(),
//               IngredientSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), child: HomeAppBar()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TabBarView(
            children: [
              CategorySection(),
              PopularRecipesSection(), // Or FeaturedCollectionsSection() or RecentRecipesSection()
            ],
          ),
        ),
      ),
    );
  }
}



// Featured Collections Section
class FeaturedCollectionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Featured Collections',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.collections_bookmark),
                ),
                title: Text('Collection ${index + 1}'),
                subtitle: Text('${10 + index} recipes'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        ),
      ],
    );
  }
}

// Recent Recipes Section
class RecentRecipesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Recent Recipes',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.restaurant_menu),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recipe ${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Added ${index + 1} days ago',
                            style: Theme.of(context).textTheme.bodySmall,
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
      ],
    );
  }
}
