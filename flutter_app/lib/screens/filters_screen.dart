import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../main.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  Map<String, bool> curFilters = {
    '_isGlutenFree': false,
    '_isVegan': false,
    '_isVegetarian': false,
    '_isLactoseFree': false,
  };

  FiltersScreen(this.saveFilters, this.curFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  buildSwitchTile(
      String title, String description, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(description),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            InkWell(
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  widget.saveFilters(widget.curFilters);},
              ),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Your Meal Prefereances',
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchTile(
                    'Gluten Free',
                    'Show only Gluten-Free Meals',
                    widget.curFilters['_isGlutenFree'],
                    (newVal) {
                      setState(
                        () {
                          widget.curFilters['_isGlutenFree'] = newVal;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Vegan',
                    'Show only Vegan Meals',
                    widget.curFilters['_isVegan'],
                    (newVal) {
                      setState(
                        () {
                          widget.curFilters['_isVegan'] = newVal;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Vegetarian',
                    'Show only Vegetarian Meals',
                    widget.curFilters['_isVegetarian'],
                    (newVal) {
                      setState(
                        () {
                          widget.curFilters['_isVegetarian'] = newVal;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Lactose Free',
                    'Show only Lactose Free Meals',
                    widget.curFilters['_isLactoseFree'],
                    (newVal) {
                      setState(
                        () {
                          widget.curFilters['_isLactoseFree'] = newVal;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
