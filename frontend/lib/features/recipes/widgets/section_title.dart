

import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text, this.isViewAll = false});

  final String text;
  final bool isViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: KConstants.textColor,
          ),
        ),
        isViewAll
            ? Text(
                "VIEW ALL",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: KConstants.primary,
                ),
              )
            : SizedBox()
      ],
    );
  }
}