import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/widgets/category_card.dart';
import 'package:frontend/models/category_model.dart';
import 'package:frontend/providers/category_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return categoryProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : categoryProvider.categories!.isEmpty ||
                categoryProvider.categories == null
            ? Center(
                child: Text("No categories yet"),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await categoryProvider.refetchCategories();
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          hintText: "Search",
                          hintStyle: TextStyle(color: KConstants.textColor),
                          prefixIcon: Icon(Iconsax.search_normal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: KConstants.secondary,
                        ),
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: GridView.builder(
                            // physics: BouncingScrollPhysics(),
                            itemCount: categoryProvider.categories!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 220,
                            ),
                            itemBuilder: (context, index) {
                              CategoryModel category =
                                  categoryProvider.categories![index];

                              return CategoryCard(category: category);
                            }),
                      )
                    ],
                  ),
                ),
              );
  }
}
