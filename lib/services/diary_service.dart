import 'package:flutter/material.dart';
import '../models/diary_models.dart';
import 'prepasto_api_service.dart';

class DiaryProvider with ChangeNotifier{
  Diary? currentDiary; // Note that the currentDiary could hold null values

  void fetchDiaryForToday() async{
    DateTime today = DateTime.now();
    currentDiary = await BackendApiService.fetchDiaryForDate(today);
    notifyListeners();
  }
}