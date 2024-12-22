
import 'package:flutter/material.dart';
import 'package:frontend/features/recipes/widgets/section_title.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            text: 'Trending',
          ),
          SizedBox(height: 10),
          //trending recipes here
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        margin: EdgeInsets.only(right: 10),
                        width: 150,
                        color: Colors.red,
                      ),
                      SizedBox(height: 5),
                      Text("Recipe Name"),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}