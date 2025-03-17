import 'package:flutter/material.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/button.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/colors.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/textfield.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/JSON/users.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/profile.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/signup.dart';
import '../SQLite/database_helper.dart';

// Screen for user login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usrName = TextEditingController(); // Controller for username input field
  final password = TextEditingController(); // Controller for password input field

  bool isChecked = false; // Boolean to track whether "Remember me" checkbox is checked
  bool isLoginTrue = false; // Boolean to track if login is successful

  final db = DatabaseHelper(); // Instance of database helper class

  // Function to handle login process
  login() async {
    Users? usrDetails = await db.getUser(usrName.text); // Getting user details from database
    var res = await db.authenticate(Users(usrName: usrName.text, password: password.text)); // Authenticating user credentials
    if (res == true) { // If authentication successful
      if (!mounted) return; // Check if widget is still mounted
      Navigator.push( // Navigate to profile screen
        context,
        MaterialPageRoute(
          builder: (context) => Profile(profile: usrDetails),
        ),
      );
    } else { // If authentication fails
      setState(() {
        isLoginTrue = true; // Set login status to true
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 239, 247), // Setting background color
      body: Container(
        // Container with background image
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.75,
            image: AssetImage("assets/Zoomed_Doodle_2.jpg"), // Background image
            fit: BoxFit.cover, // Covering the entire container
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container for login title
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10), // Padding for the container
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 206, 228), // Setting background color
                      borderRadius: BorderRadius.circular(20), // Applying border radius
                    ),
                    child: const Text(
                      "LOGIN", // Text content
                      style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w500), // Text style
                    ),
                  ),
                  const SizedBox(height: 20), // Adding spacing between elements
                  // Username input field
                  InputField(
                    hint: "Username", // Placeholder text
                    icon: Icons.account_circle, // Icon for username
                    controller: usrName, // Controller for username input
                  ),
                  // Password input field
                  InputField(
                    hint: "Password", // Placeholder text
                    icon: Icons.lock, // Icon for password
                    controller: password, // Controller for password input
                    passwordInvisible: true, // Setting password field as invisible
                  ),
                  // "Remember me" checkbox
                  Container(
                    padding: EdgeInsets.all(2), // Padding for the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Applying border radius
                    ),
                    child: ListTile(
                      horizontalTitleGap: 2, // Setting horizontal gap for title
                      title: const Text("Remember me", style: TextStyle(fontWeight: FontWeight.bold),), // Checkbox label
                      leading: Checkbox(
                        activeColor: primaryColor, // Checkbox active color
                        value: isChecked, // Current state of checkbox
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked; // Toggle checkbox state
                          });
                        },
                      ),
                    ),
                  ),
                  // Button for login
                  Button(
                    label: "LOGIN", // Button label
                    press: () {
                      login(); // Calling login function
                    },
                  ),
                  // Row for "Don't have an account?" text and sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container for "Don't have an account?" text
                      Container(
                        padding: EdgeInsets.all(10), // Padding for the container
                        decoration: BoxDecoration(
                          color: Color(0xFF0FC8D4), // Setting background color
                          borderRadius: BorderRadius.circular(30), // Applying border radius
                        ),
                        child: const Text(
                          "Don't have an account?", // Text content
                          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold), // Text style
                        ),
                      ),
                      // Sign up button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(), // Navigating to sign up screen
                            ),
                          );
                        },
                        child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), // Button label
                      )
                    ],
                  ),
                  // Display error message if login fails
                  isLoginTrue
                      ? Text(
                          "Username or password is incorrect", // Error message
                          style: TextStyle(color: Colors.red.shade900), // Text style
                        )
                      : const SizedBox(), // Empty container if no error
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}