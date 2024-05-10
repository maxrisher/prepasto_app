import 'package:flutter/material.dart';
import 'package:prepasto/services/mock_authentication_service.dart';
import 'screens/start_screen.dart';
import 'screens/camera_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => MockAuthenticationService(),
    child: MyApp()));
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
            return CameraScreen();
          } else {
            return StartScreen();
          }
        }
      )
    );
  }
}
