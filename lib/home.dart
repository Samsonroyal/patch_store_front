
import 'package:flutter/material.dart';
import 'package:store_front/screens/cart_screen/cart_screen.dart';
import 'package:store_front/screens/discover_screen/components/bottom_navigation/bottom_nav.dart';
import 'package:store_front/screens/discover_screen/discover_screen.dart';
import 'package:store_front/screens/inbox_screen/inbox_screen.dart';
import 'package:store_front/screens/profile_screen/profile_screen.dart';
import 'package:store_front/screens/sell_screen/sell_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List screens = [
    const DiscoverScreen(),
    const CartScreen(),
    const SellScreen(),
    const InboxScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: screens[currentIndex]
    );
  }
}