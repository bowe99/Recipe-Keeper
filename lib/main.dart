import 'package:flutter/material.dart';

import './categories_screen.dart';
void main() => runApp(RecipeKeeper());

class RecipeKeeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriiesScreen(),
    );
  }
}

