import 'package:flutter/material.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/button.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/colors.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/login.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/signup.dart';

// Screen for authentication options (login or sign up)
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0FC8D4), // Setting background color
      body: Container(
        // Container with background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Zoomed_Doodle_2.jpg"), // Background image
            fit: BoxFit.cover, // Covering the entire container
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20), // Setting vertical padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container for "LET'S GET STARTED" text
                  Container(
                    padding: EdgeInsets.all(15), // Padding for the container
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255), // Setting background color
                      borderRadius: BorderRadius.circular(20), // Applying border radius
                    ),
                    child: const Text(
                      "LET'S GET STARTED", // Text content
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor), // Text style
                    ),
                  ),
                  const SizedBox(height: 10), // Adding spacing between elements
                  
                  // Button for login
                  Button(
                    label: "LOGIN", // Button label
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()), // Navigating to login screen
                      );
                    },
                  ),
                  
                  // Button for sign up
                  Button(
                    label: "SIGN UP", // Button label
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()), // Navigating to sign up screen
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}