import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/features/recipes/widgets/chef_choice_section.dart';
import 'package:frontend/features/recipes/widgets/trending_section.dart';
import 'package:frontend/features/recipes/widgets/you_may_like_section.dart';

import '../widgets/inspiration_app_bar.dart';

class InspirationScreen extends StatelessWidget {
  const InspirationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstants.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: InspirationAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            //trending section here
            TrendingSection(),
            //you may like section here

            SizedBox(height: 15),
            YouMayLikeSection(),
            //master chef choice section here
            SizedBox(height: 15),
            ChefChoiceSection(),
          ],
        ),
      ),
    );
  }
}
