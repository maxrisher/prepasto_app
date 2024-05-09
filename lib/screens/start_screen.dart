import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../widgets/start_screen_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(flex: 1),  // More flexible than a fixed-height SizedBox
          Text("Prepasto", style: TextStyle(fontSize: 40),),
          Spacer(flex: 1),  // Adjust the flex to control space proportion
          Column(
            children: [
              startScreenButton(
                color: Colors.white,
                text: "LOG IN",
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              startScreenButton(
                color: Colors.white,
                text: "SIGN UP",
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}