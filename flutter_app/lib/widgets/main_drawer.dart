import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/categories_screen.dart';

class MainDrawer extends StatelessWidget {
  buildListTile(String title, IconData icon, Function screenHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
    onTap: screenHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking UP!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
//        buildListTile('Meals', Icons.restaurant,() {Navigator.of(context).pushNamed('/');},),
//        buildListTile('Filters', Icons.settings, () { Navigator.of(context).pushNamed(FiltersScreen.routeName);},),

        buildListTile('Meals', Icons.restaurant,() {Navigator.of(context).pushReplacementNamed('/');},),
        buildListTile('Filters', Icons.settings, () { Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);},),
      ],
    ));
  }
}
