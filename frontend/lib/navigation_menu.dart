import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
      return Scaffold(
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Material(
            elevation: 7,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 7,
              iconSize: 24,
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
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb_outline_rounded),
                  label: "Inspirations",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Account",
                ),
              ],
            ),
          ),
        ),
        body: navigationProvider.screens
            .elementAt(navigationProvider.selectedIndex),
      );
    });
  }
}
