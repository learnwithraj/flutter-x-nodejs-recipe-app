import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Fine Food",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: KConstants.primary,
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: -0.2,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: KConstants.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.notification,
                color: KConstants.primary,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TabBar(
          dividerColor: KConstants.secondary,
          onTap: (value) async {},
          splashFactory: NoSplash.splashFactory,
          // Remove tabAlignment and isScrollable
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          unselectedLabelColor: KConstants.textColor,
          labelColor: KConstants.primary,
          // Add these properties for equal width
          labelPadding: EdgeInsets.zero,
          tabAlignment: TabAlignment.fill,
          tabs: [
            Tab(
              height: 35,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            Tab(
              height: 35,
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "COLLECTIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.2,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
