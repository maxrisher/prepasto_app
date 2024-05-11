import 'package:flutter/material.dart';
import 'diary_entry_detail_screen.dart';

class DiaryLogScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context){
            return NutritionLogHome();
          }
        );
      },
    );
  }
}

class NutritionLogHome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('May 10 2024') // The selected date
        ),
      body: Center(
        child: ListView.builder(
        itemCount: 10, // The meals in the day
        itemBuilder: (context, index) {
          return ListTile(title: Text('Food item $index'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MealDetailScreen(foodItemId: index),
              )
            );
          }
          );
        }
        ),
        )
    );
  }
}