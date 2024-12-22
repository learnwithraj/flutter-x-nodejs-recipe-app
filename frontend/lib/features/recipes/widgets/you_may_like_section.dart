
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/features/recipes/widgets/section_title.dart';

class YouMayLikeSection extends StatelessWidget {
  const YouMayLikeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            text: 'You May Like',
            isViewAll: true,
          ),
          SizedBox(height: 10),
          //trending recipes here
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.red,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Recipe Name",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            color: KConstants.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 4.5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 13.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "(23)",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}