import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function updateFavoriteList;
  final Function  isFavorite;
  MealDetailScreen(this.updateFavoriteList,this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        sectionTitle,
        style: Theme.of(context).textTheme.title,
      )),
    );
  }

  Widget buildList(Widget childWidget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      child: childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingridiants'),
            buildList(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildList(
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading:
                                CircleAvatar(child: Text('# ${index + 1}')),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(
                            color: Colors.black,
                          )
                        ],
                      )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId) ? Icon(Icons.star,)
        : Icon(Icons.star_border),
        onPressed: () => updateFavoriteList(mealId),
      ),
    );
  }
}
