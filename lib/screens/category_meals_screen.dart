import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

// The screen of Meals in each category you select
class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/CategoryMealsScreen';

  final List<Meal> availableMeals;
  CategoryMealsScreen({this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      categoryId = routeArguments['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categoriesIds.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
