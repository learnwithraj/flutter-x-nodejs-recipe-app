import 'package:flutter/material.dart';
import 'package:frontend/models/ingredients_model.dart';

import '../../../constants/constants.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key, required this.ingredients});
  final IngredientsModel ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: 175,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(fit: BoxFit.cover, ingredients.image),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          ingredients.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: KConstants.textColor,
          ),
        ),
      ],
    );
  }
}
