import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: 175,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://junifoods.com/wp-content/uploads/2023/11/Easy-Chicken-Momo-Dumplings-Sajilo-Kukhura-ko-Momo-%E0%A4%B8%E0%A4%9C%E0%A4%BF%E0%A4%B2%E0%A5%8B-%E0%A4%95%E0%A5%81%E0%A4%96%E0%A5%81%E0%A4%B0%E0%A4%BE%E0%A4%95%E0%A5%8B-%E0%A4%AE%E0%A4%AE.jpg"),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Soup",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: KConstants.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
