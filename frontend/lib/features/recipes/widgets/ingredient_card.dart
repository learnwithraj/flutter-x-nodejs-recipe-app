
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key});

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
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://www.lovefoodhatewaste.com/sites/default/files/styles/twitter_card_image/public/2022-08/Potatoes-shutterstock-1721688538.jpg.webp?itok=4hLqSjDi"),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Potatoes",
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
