import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/constants.dart';

class InspirationAppBar extends StatelessWidget {
  const InspirationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Inspiration",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: KConstants.textColor,
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
      ),
    );
  }
}
