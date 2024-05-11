import 'package:flutter/material.dart';
import '../models/diary_models.dart';
import 'mock_prepasto_api_service.dart';

class DiaryService with ChangeNotifier{
  Diary? currentDiary; // Note that the currentDiary could hold null values

  void fetchDiaryForToday() async{
    DateTime today = DateTime.now();
    var apiService = BackendApiService('mocked-token');
    currentDiary = await apiService.fetchDiaryForDate(today);
    notifyListeners();
  }
}