import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
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
        return true;
      }
      return false;
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }

  Future<void> signUp(String email, String password) async {
    // Your sign up logic using your preferred authentication method (e.g., Firebase)
  }
}


