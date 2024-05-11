import 'package:flutter/material.dart';
import 'package:prepasto/screens/main_screen.dart';
import 'package:provider/provider.dart';
import '../services/mock_authentication_service.dart';
import 'package:prepasto/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final String email = _emailController.text;
                  final String password = _passwordController.text;
                  bool successfulLogin = await Provider.of<MockAuthenticationService>(context, listen: false)
                      .login(email, password);
                  if (successfulLogin) {
                    print("Successful login");
                    Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  } else {
                    print("Login failed");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to login in, please try again.'),
                        backgroundColor: Colors.red,),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
