import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            )),
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
            page: () => CategoryMealsScreen()),
        GetPage(name: '/', page: () => TabsScreen()),
        GetPage(name: '/home', page: () => CategoriesScreen()),
        GetPage(name: '/filters', page: () => FiltersScreen()),
        GetPage(
            name: MealDetailScreen.routeName, page: () => MealDetailScreen()),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => CategoriesScreen()),
    );
  }
}
