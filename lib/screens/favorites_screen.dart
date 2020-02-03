import 'package:app_3/models/meal.dart';
import 'package:app_3/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritMeals;

  FavoritesScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    if(favoritMeals.isEmpty){
    return Center(
      child: Text('You have no favorites yet!'),
    );
    }
    else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritMeals[index].id,
              title: favoritMeals[index].title,
              imageUrl: favoritMeals[index].imageUrl,
              duration: favoritMeals[index].duration,
              affordability: favoritMeals[index].affordability,
              complexity: favoritMeals[index].complexity,
              
            );
          },
          itemCount: favoritMeals.length,
        );
    }
  }
}