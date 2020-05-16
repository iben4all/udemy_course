import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class BottomTabsScreen extends StatefulWidget {

  List<Meal> favoriteMeals;
  BottomTabsScreen(this.favoriteMeals);


  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String,Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories',},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites',},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('category'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('favorite'),
            ),
          ],
        ));
  }
}
