import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorite extends StatefulWidget {
  final List<Meal> favoriteMeals;

  Favorite({this.favoriteMeals});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    widget.favoriteMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.favoriteMeals.length);
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Your Favorite-Meals is empty!',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
