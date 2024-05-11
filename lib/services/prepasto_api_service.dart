import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BackendApiService{
  final String baseUrl = 'https://yourdjangoapi.com/api';
  final String _token;

  BackendApiService(this._token);

  String get token => _token;

// Should return a JSON of all food entries in a given day
  Future<List<dynamic>> fetchDiaryForDate(String date) async {
    final response = await http.get(
      Uri.parse('$baseUrl/dayentries?date=$date'),
      headers: {
        'Authorization': 'Token $_token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load calorie entries');
    }
  }

  // Add a method to create food entries

  // Add a method to edit food entries
}
