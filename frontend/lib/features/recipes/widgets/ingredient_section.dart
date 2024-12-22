import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/features/recipes/widgets/ingredient_card.dart';
import 'package:iconsax/iconsax.dart';

class IngredientSection extends StatelessWidget {
  const IngredientSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: KConstants.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Ingredient",
                        style: TextStyle(
                          color: KConstants.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
                // physics: BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 190,
                ),
                itemBuilder: (context, index) {
                  return IngredientCard();
                }),
          )
        ],
      ),
    );
  }
}
