import 'package:flutter/material.dart';
import 'package:prepasto/screens/main_screen.dart';
import 'package:prepasto/services/mock_authentication_service.dart';
import 'screens/start_screen.dart';
import 'screens/camera_screen.dart';
import 'package:provider/provider.dart';
import 'models/diary_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => MockAuthenticationService()),
      ChangeNotifierProvider(create: (context) => DiaryModel()),
    ],
    child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: Consumer<MockAuthenticationService>(
        builder: (context, authService, child){
          if (authService.isLoggedIn){
            return MainScreen();
          } else {
            return StartScreen();
          }
        }
      )
    );
  }
}
