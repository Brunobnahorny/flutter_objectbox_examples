import 'package:flutter/material.dart';
import 'package:flutter_objectbox_examples/home_controller.dart';

class SearchField extends StatelessWidget {
  final HomeController controller;

  const SearchField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchTEC,
            ),
          ),
          ElevatedButton(
            onPressed: controller.searchSubmitted,
            child: const Text('Pesquisar'),
          ),
        ],
      ),
    );
  }
}
