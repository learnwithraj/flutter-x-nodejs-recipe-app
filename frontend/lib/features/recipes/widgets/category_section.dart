
import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/widgets/category_card.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/constants.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
                // physics: BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard();
                }),
          )
        ],
      ),
    );
  }
}