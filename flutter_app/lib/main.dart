import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/bottom_tab_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _curFilters = {
    '_isGlutenFree': false,
    '_isVegan': false,
    '_isVegetarian': false,
    '_isLactoseFree': false,
  };

  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String,bool> filterData) {
    setState(() {
      _curFilters = filterData;
      _avilableMeals = DUMMY_MEALS.where((meal) {
        if (_curFilters['_isGlutenFree'] && !meal.isGlutenFree ){
          return false;
        }
        if (_curFilters['_isVegan'] && !meal.isVegan ){
          return false;
        }
        if (_curFilters['_isVegetarian'] && !meal.isVegetarian ){
          return false;
        }
        if (_curFilters['_isLactoseFree'] && !meal.isLactoseFree ){
          return false;
        }
        return true;
      }).toList();
    },);
  }

  void _toggleFavoriteMeals(String id){
    setState(() {
      final int index = favoriteMeals.indexWhere((meal) => meal.id == id);
      if (index >= 0){
        favoriteMeals.removeAt(index);
      }else{
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      }
      print(favoriteMeals);
    });

  }

  bool isFavorite(mealId){
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
//      home: BottomTabsScreen(),
      routes: {
        '/' :(ctx) => BottomTabsScreen(favoriteMeals),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_setFilters, _curFilters),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_avilableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavoriteMeals,isFavorite),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Meals App'),),
          body: Container(
            alignment: Alignment.center,
              child: Text('Navigator')),
    );
  }
}
