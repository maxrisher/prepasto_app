import 'package:flutter/material.dart';
import 'package:prepasto/services/diary_service.dart';
import 'package:provider/provider.dart';
import 'diary_entry_detail_screen.dart';

// We use a stateful widget so that we can get any initial diary entry data
class DiaryLogScreen extends StatefulWidget{
  @override
  State<DiaryLogScreen> createState() => _DiaryLogScreenState();
}


class _DiaryLogScreenState extends State<DiaryLogScreen>{
  //This is our initialization method, here we fetch any existing diary data for this screen. This is only called when we insert this widget into the widget tree (when we navigate to it)
  @override
  void initState(){
    super.initState();
    final diaryProvider = Provider.of<DiaryService>(context, listen:false);
    diaryProvider.fetchDiaryForToday();
  }

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
    // Provider.of<DiaryService>(context, listen:false).fetchDiaryForToday();

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