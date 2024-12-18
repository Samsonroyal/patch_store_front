import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 140,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFF7A6EAE)
              : const Color(0xFFCACACA),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style:  TextStyle(fontSize: 12,  color: selectedIndex == index ? Colors.white : Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
