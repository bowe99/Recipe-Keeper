import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    
    final meal = DUMMY_MEALS.where((mealTest){
      return mealTest.id == mealId; 
    }).toList();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Description'
          ),
        ),
          body: Center(
        child: Text(meal[0].title),
      ),
    );
  }
}