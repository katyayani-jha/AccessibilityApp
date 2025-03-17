import 'package:accessibility_app/flutter_sqlite_auth_app/Views/login.dart';
import 'package:flutter/material.dart';
import 'package:accessibility_app/srestha_s_application4/core/app_export.dart';
import 'package:accessibility_app/srestha_s_application4/presentation/landing_keyboard_screen/landing_keyboard_screen.dart';
import 'package:accessibility_app/srestha_s_application4/widgets/custom_icon_button.dart';

// Screen for the landing page of the application
class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Setting background color
        body: SizedBox(
          width: double.maxFinite, // Filling the width of the screen
          child: Column(
            children: [
              SizedBox(height: 38.v), // Vertical spacing
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildFourteen(context), // Building section for megaphone and lock icons
                      SizedBox(height: 29.v), // Vertical spacing
                      _buildThirteen(context), // Building section for settings and clear text
                      SizedBox(height: 9.v), // Vertical spacing
                      GestureDetector(
                        // Gesture detector to detect swipe-up gesture
                        onVerticalDragEnd: (details) {
                          // Checking if the swipe direction is upward
                          if (details.primaryVelocity! < 0) {
                            // Navigating to the next page (LandingKeyboardScreen)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingKeyboardScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 82.v, // Setting height of the container
                          width: 368.h, // Setting width of the container
                          decoration: BoxDecoration(
                            color: appTheme.cyan300.withOpacity(0.75), // Container color with opacity
                            borderRadius: BorderRadius.circular(30.h), // Applying border radius
                          ),
                        ),
                      ),
                      SizedBox(height: 22.v), // Vertical spacing
                      Container(
                        height: 82.v, // Setting height of the container
                        width: 368.h, // Setting width of the container
                        decoration: BoxDecoration(
                          color: appTheme.cyan300.withOpacity(0.75), // Container color with opacity
                          borderRadius: BorderRadius.circular(30.h), // Applying border radius
                        ),
                      ),
                      SizedBox(height: 22.v), // Vertical spacing
                      Container(
                        height: 82.v, // Setting height of the container
                        width: 368.h, // Setting width of the container
                        decoration: BoxDecoration(
                          color: appTheme.cyan300.withOpacity(0.75), // Container color with opacity
                          borderRadius: BorderRadius.circular(30.h), // Applying border radius
                        ),
                      ),
                      SizedBox(height: 267.v), // Vertical spacing
                      _buildTwelve(context), // Building section with text input
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section Widget for megaphone and lock icons
  Widget _buildFourteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 43.h,
        right: 30.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMegaphone, // Image path for megaphone icon
            height: 17.v, // Setting height of the icon
            width: 26.h, // Setting width of the icon
            margin: EdgeInsets.only(
              top: 14.v,
              bottom: 22.v,
            ),
          ),
          CustomIconButton(
            height: 54.adaptSize, // Setting height of the button
            width: 54.adaptSize, // Setting width of the button
            padding: EdgeInsets.all(12.h), // Setting padding of the button
            child: CustomImageView(
              imagePath: ImageConstant.imgLock, // Image path for lock icon
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())); // Navigating to login screen
            },
          ),
        ],
      ),
    );
  }

  // Section Widget for settings and clear text
  Widget _buildThirteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSettings, // Image path for settings icon
            height: 30.adaptSize, // Setting height of the icon
            width: 30.adaptSize, // Setting width of the icon
            margin: EdgeInsets.only(
              top: 9.v,
              bottom: 13.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
              "Recent History", // Text for recent history
              style: theme.textTheme.displaySmall, // Applying text style
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 13.v,
            ),
            child: Text(
              "Clear", // Text for clear
              style: theme.textTheme.titleLarge, // Applying text style
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwelve(BuildContext context) {
    return GestureDetector(
      // Detect swipe-up gesture
      onVerticalDragEnd: (details) {
        // Check if the swipe direction is upward
        if (details.primaryVelocity! < 0) {
          // Navigate to the landing page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingKeyboardScreen(),
            ),
          );
        }
      },
      child: SizedBox(
        height: 234.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 135.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder45,
                  image: DecorationImage(
                    image: AssetImage(
                      ImageConstant.imgGroup8,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40.v),
                    const Text(
                      "What’s on your mind?",
                      style: CustomTextStyles.displaySmallOnPrimary,
                    ),
                    SizedBox(height: 5.v),
                    Container(
                      height: 54.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: appTheme.gray100,
                        borderRadius: BorderRadius.circular(
                          27.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextStyles {
  static const TextStyle displaySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    // Add more text styles properties as needed
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    // Add more text styles properties as needed
  );

  static const TextStyle displaySmallOnPrimary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color:
        Color.fromARGB(255, 2, 2, 2), // Adjust color according to your design
    // Add more text styles properties as needed
  );
}
