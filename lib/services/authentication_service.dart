import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class AuthenticationService with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('https://your-backend-url.com/api/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        // Store the token and other necessary data
        var djangoAuthToken = jsonDecode(response.body)['token'];
        await _storage.write(key: 'app_token', value: djangoAuthToken);
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try{
      var response = await http.post(
        Uri.parse('https://your-backend-url.com/api/signup/'),
        headers: <String, String>{
        'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }

  Future<void> logOut() async{
    _storage.delete(key: 'djangoAuthToken'); // delete our auth token
    _isLoggedIn = false; // set the logged in variable
    notifyListeners(); // Tell subscribers that we're logged out
    print("logged out");
  }
}
