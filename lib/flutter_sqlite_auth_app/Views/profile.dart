import 'package:flutter/material.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/button.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Components/colors.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/JSON/users.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/Views/login.dart';
import 'package:accessibility_app/flutter_sqlite_auth_app/SQLite/database_helper.dart';
import 'package:accessibility_app/srestha_s_application4/core/app_export.dart' as srestha;

// Profile screen displaying user information
class Profile extends StatelessWidget {
  final Users? profile; // User profile data
  const Profile({Key? key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold for overall layout
      body: SingleChildScrollView(
        // Allowing scrolling if content overflows
        child: SafeArea(
          // Ensuring content is within safe area
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20), // Padding for content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // User avatar
                const CircleAvatar(
                  backgroundColor: primaryColor, // Avatar background color
                  radius: 77, // Avatar radius
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/no_user.jpg"), // Avatar image
                    radius: 75, // Image radius
                  ),
                ),
                const SizedBox(height: 10), // Adding vertical space
                Text(
                  profile!.fullName ?? "", // Displaying user's full name
                  style: const TextStyle(fontSize: 28, color: primaryColor), // Text style
                ),
                Text(
                  profile!.email ?? "", // Displaying user's email
                  style: const TextStyle(fontSize: 17, color: Colors.grey), // Text style
                ),
                Button(
                  // Button to navigate to the application
                  label: "GET STARTED", // Button label
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => srestha.Sizer(
                          builder: (context, orientation, deviceType) {
                            return MaterialApp(
                              theme: srestha.theme, // Using application theme
                              title: 'srestha_s_application4', // Application title
                              debugShowCheckedModeBanner: false, // Removing debug banner
                              initialRoute: srestha.AppRoutes.landingPageScreen, // Initial route
                              routes: srestha.AppRoutes.routes, // Application routes
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                // List of user details
                ListTile(
                  leading: const Icon(Icons.person, size: 30), // Icon for full name
                  subtitle: const Text("Full name"), // Subtitle for full name
                  title: Text(profile!.fullName ?? ""), // Displaying user's full name
                ),
                ListTile(
                  leading: const Icon(Icons.email, size: 30), // Icon for email
                  subtitle: const Text("Email"), // Subtitle for email
                  title: Text(profile!.email ?? ""), // Displaying user's email
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle, size: 30), // Icon for username
                  subtitle: Text(profile!.usrName), // Subtitle for username
                  title: const Text("admin"), // Displaying user's username
                ),
                SizedBox(height: 10), // Adding vertical space
                Button(
                  // Button to delete user account
                  press: () {
                    _deleteAccount(context); // Calling function to delete account
                  },
                  label: 'Delete Account', // Button label
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to delete user account
  void _deleteAccount(BuildContext context) async {
    try {
      await DatabaseHelper().deleteUser(profile!.usrName); // Deleting user account from database
      Navigator.pushReplacement( // Navigating back to login screen
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      showDialog(
        // Showing error dialog if deletion fails
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"), // Dialog title
            content: Text("An error occurred while deleting the account: $e"), // Error message
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Closing dialog
                },
                child: Text("OK"), // OK button
              ),
            ],
          );
        },
      );
    }
  }
}