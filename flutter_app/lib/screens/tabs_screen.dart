import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Meal> dummyList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'category'),
              Tab(icon: Icon(Icons.favorite), text: 'favorite'),
            ]),
          ),
          body: TabBarView(children: [
            CategoriesScreen(),
            FavoriteScreen(dummyList),
          ])),
    );
  }
}
