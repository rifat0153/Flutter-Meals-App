import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({IconData icons, String title, Function tapHandler}) {
    return ListTile(
      leading: Icon(icons, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(height: 20),
          buildListTile(
            title: 'Meals',
            icons: Icons.restaurant,
            tapHandler: () {
              Get.offNamed('/');
            },
          ),
          buildListTile(
            title: 'Filters',
            icons: Icons.settings,
            tapHandler: () {
              Get.toNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
