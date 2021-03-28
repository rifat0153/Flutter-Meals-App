import 'package:flutter/material.dart';
import 'package:meals/widget/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Filters')),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
