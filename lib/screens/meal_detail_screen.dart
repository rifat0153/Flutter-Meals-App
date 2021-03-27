import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final mealId = Get.arguments as String;

  Widget buildSectionTitle(context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildListContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListContainer(
                child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                );
              },
            )),
            buildSectionTitle(context, 'Steps'),
            buildListContainer(
                child: ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading:
                                CircleAvatar(child: Text('# ${index + 1}')),
                            title: Text('${selectedMeal.steps[index]}'),
                          ),
                          Divider(),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
