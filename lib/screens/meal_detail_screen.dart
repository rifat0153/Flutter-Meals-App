import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final mealId = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Meal Detail for: $mealId'),
      ),
    );
  }
}
