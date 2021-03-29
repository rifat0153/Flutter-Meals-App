import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
      ),
      home: TabsScreen(),
      // routes: {
      //   CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      // },
      // initialRoute: '/home',
      // routes: {
      //   CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
      //   CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      // },
      getPages: [
        GetPage(
            name: CategoryMealsScreen.routeName,
            page: () => CategoryMealsScreen(_availableMeals)),
        GetPage(name: '/', page: () => TabsScreen()),
        GetPage(name: '/home', page: () => CategoriesScreen()),
        GetPage(name: '/filters', page: () => FiltersScreen(_filters ,_setFilters)),
        GetPage(
            name: MealDetailScreen.routeName, page: () => MealDetailScreen()),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => CategoriesScreen()),
    );
  }
}
