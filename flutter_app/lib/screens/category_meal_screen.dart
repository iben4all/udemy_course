import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> avilableMeals;
  CategoryMealsScreen(this.avilableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedCategoryMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedCategoryMeals = widget.avilableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
    setState(() {
      displayedCategoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedCategoryMeals[index].id,
              title: displayedCategoryMeals[index].title,
              affordability: displayedCategoryMeals[index].affordability,
              complexity: displayedCategoryMeals[index].complexity,
              duration: displayedCategoryMeals[index].duration,
              imageUrl: displayedCategoryMeals[index].imageUrl,
              meal: displayedCategoryMeals[index],
            );
          },
          itemCount: displayedCategoryMeals.length,
        ));
  }
}
