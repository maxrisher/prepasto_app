
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final int foodItemId;

  MealDetailScreen({required this.foodItemId});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Food item details $foodItemId'),
      ),
      body: Center(child: Text('Details for item $foodItemId'),
      ),
      );
  }
}