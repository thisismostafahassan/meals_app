import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

// The page where we display the Categories
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((categoryData) {
        return CategoryItem(
          title: categoryData.title,
          id: categoryData.id,
          color: categoryData.color,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
