import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Discover",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_sharp),
          label: "Sell",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox_outlined),
          label: "Inbox",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          label: "Profile",
        ),
      ],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: const Color(0xFFB45A9B),
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }
}
