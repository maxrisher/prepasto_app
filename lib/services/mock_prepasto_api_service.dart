import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/diary_models.dart';

class BackendApiService{
  final String baseUrl = 'https://yourdjangoapi.com/api';
  final String _token;

  BackendApiService(this._token);

// Should return a JSON of all food entries in a given day
  Future<Diary?> fetchDiaryForDate(DateTime date) async {
    String formattedDate = "${date.year}-${date.month}-${date.day}";
    String url = "$baseUrl/diaries/date/$formattedDate";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200){
      var data = json.decode(response.body);
      return Diary.fromJson(data);
    } else {
      throw Exception('Failed to load calorie entries');
    }
  }

  // Add a method to create food entries

  // Add a method to edit food entries
}
