
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding:  const EdgeInsets.all(12) ,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.grey, size: 24.0,),
            SizedBox(width: 10,),
            Text("What are you looking for?", style: TextStyle(color: Colors.grey, fontSize: 16 ),)

          ],
        ),
      ),
    );
  }
}
