import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'favorite.dart';
import '../screens/categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen({this.favoriteMeals});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> theBody;
  int _selctedPageIndex = 0;

  @override
  void initState() {
    theBody = [
      {
        'Page': CategoriesScreen(),
        'Title': 'Categories',
      },
      {
        'Page': Favorite(
          favoriteMeals: widget.favoriteMeals,
        ),
        'Title': 'Favorite',
      },
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selctedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theBody[_selctedPageIndex]['Title'] as String),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: theBody[_selctedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selctedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
