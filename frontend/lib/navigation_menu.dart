import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/providers/navigation_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconSize: 28,
          currentIndex: navigationProvider.selectedIndex,
          selectedItemColor: KConstants.primary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            color: KConstants.primary,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onTap: (value) {
            navigationProvider.onTap(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_1,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.bubble,
              ),
              label: "Inspirations",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.user,
              ),
              label: "Account",
            ),
          ],
        ),
        body: navigationProvider.screens
            .elementAt(navigationProvider.selectedIndex),
      );
    });
  }
}
