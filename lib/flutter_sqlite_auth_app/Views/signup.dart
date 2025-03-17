import 'package:flutter/material.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/button.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/colors.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/textfield.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/JSON/users.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/login.dart';

import '../SQLite/database_helper.dart';

// Screen for user registration
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // Controllers for text fields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();

  // Function to sign up new user
  signUp() async {
    var res = await db.createUser(Users(fullName: fullName.text,email: email.text,usrName: usrName.text, password: password.text));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen())); // Navigating to login screen after successful registration
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold for overall layout
      body: Center(
        child: SingleChildScrollView(
          // Allowing scrolling if content overflows
          child: SafeArea(
            // Ensuring content is within safe area
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title for registration
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Register New Account",style: TextStyle(color: primaryColor,fontSize: 55,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 20), // Adding vertical space
                // Text fields for user details
                InputField(hint: "Full name", icon: Icons.person, controller: fullName),
                InputField(hint: "Email", icon: Icons.email, controller: email),
                InputField(hint: "Username", icon: Icons.account_circle, controller: usrName),
                InputField(hint: "Password", icon: Icons.lock, controller: password, passwordInvisible: true),
                InputField(hint: "Re-enter password", icon: Icons.lock, controller: confirmPassword, passwordInvisible: true),
                const SizedBox(height: 10), // Adding vertical space
                // Button to sign up
                Button(label: "SIGN UP", press: (){
                  signUp(); // Calling sign up function
                }),
                // Row for already have an account text and login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen())); // Navigating to login screen
                      },
                      child: Text("LOGIN"), // Login button
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}