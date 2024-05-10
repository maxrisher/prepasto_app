// DON'T USE IN PRODUCTION
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'authentication_service.dart';

class MockAuthenticationService extends AuthenticationService {
  final _storage = FlutterSecureStorage();
  bool _isLoggedIn = false;

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));  // Simulate network delay
    if (email == "test@example.com" && password == "password123") {
      await _storage.write(key: 'app_token', value: 'mocked-token');
      _isLoggedIn = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signUp(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));  // Simulate network delay
    // Assume all sign-ups are successful
    return true;
  }

  @override
  Future<void> logOut() async {
    await _storage.delete(key: 'app_token');
    _isLoggedIn = false;
    notifyListeners();
    print("Mock logged out");
  }
}
