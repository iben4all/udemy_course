import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty ? Scaffold(
//        appBar: AppBar(
//          title: Text('Favorite Meals'),
//        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
              meal: favoriteMeals[index],
            );
          },
          itemCount: favoriteMeals.length,
        ))
    : Center(child: Text('No favorite picked yet'),)
    ;
  }
}
