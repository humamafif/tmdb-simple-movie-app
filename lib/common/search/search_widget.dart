import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const SearchWidget(
      {super.key,
      required this.searchController,
      required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ashBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search Movies..',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: white),
        ),
        style: const TextStyle(color: white, fontSize: 20),
        onChanged: onSearchChanged,
      ),
    );
  }
}
