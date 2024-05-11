import 'package:flutter/material.dart';
import 'package:prepasto/services/diary_service.dart';
import 'package:provider/provider.dart';
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
    Provider.of<DiaryService>(context, listen:false).fetchDiaryForToday();

    return Scaffold(
      appBar: AppBar(
        title: Text('May 10 2024') // The selected date
        ),
      body: Consumer<DiaryService>(
        builder: (context, diaryService, child) {
          var diary = diaryService.currentDiary;
          if (diary == null){
            return Text("loading");
          }
          return ListView(
            children: diary.meals.map((meal) => ListTile(title: Text(meal.name),)).toList(),
          );
        },
      )
    );
  }
}