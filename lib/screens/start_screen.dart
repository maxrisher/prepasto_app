import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../widgets/start_screen_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 100),
            Text("Prepasto",
              style: TextStyle(fontSize: 40),),
            SizedBox(height: 10),
            MaterialButton(
              height: 100.0, 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Login',
              style: TextStyle(fontSize: 40),),
            ),
            MaterialButton(
              height: 100.0, 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Sign Up',
              style: TextStyle(fontSize: 40),),
            ),
          ],
        ),
      ),
    );
  }
}