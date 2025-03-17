import 'package:flutter/material.dart';
import 'package:accessibility_app/srestha_s_application4/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 375.h, // Setting width as 375 units, responsive to different screen sizes
          child: Column(
            children: [
              _buildAppNavigation(context), // Building app navigation UI
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillWhiteA, // Decoration for the container
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Landing Page", // Title for landing page
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.landingPageScreen), // Callback for tapping on landing page title
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Landing Keyboard", // Title for landing keyboard page
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.landingKeyboardScreen), // Callback for tapping on landing keyboard title
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile Set Up", // Title for profile setup page
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileSetUpScreen), // Callback for tapping on profile setup title
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget to build the app navigation UI
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA, // Decoration for the container
      child: Column(
        children: [
          SizedBox(height: 10.v), // Vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h), // Horizontal padding
              child: Text(
                "App Navigation", // Title for the app navigation section
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.black900, // Text color
                  fontSize: 20.fSize, // Font size
                  fontFamily: 'Roboto', // Font family
                  fontWeight: FontWeight.w400, // Font weight
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v), // Vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h), // Padding for left alignment
              child: Text(
                "Check your app's UI from the below demo screens of your app.", // Description text
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.blueGray400, // Text color
                  fontSize: 16.fSize, // Font size
                  fontFamily: 'Roboto', // Font family
                  fontWeight: FontWeight.w400, // Font weight
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v), // Vertical spacing
          Divider(
            height: 1.v, // Divider height
            thickness: 1.v, // Divider thickness
            color: appTheme.black900, // Divider color
          ),
        ],
      ),
    );
  }

  /// Common widget to build screen titles
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle, // Title for the screen
    Function? onTapScreenTitle, // Callback for tapping on the screen title
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call(); // Calling the callback function when tapped
      },
      child: Container(
        decoration: AppDecoration.fillWhiteA, // Decoration for the container
        child: Column(
          children: [
            SizedBox(height: 10.v), // Vertical spacing
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h), // Horizontal padding
                child: Text(
                  screenTitle, // Screen title text
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.black900, // Text color
                    fontSize: 20.fSize, // Font size
                    fontFamily: 'Roboto', // Font family
                    fontWeight: FontWeight.w400, // Font weight
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v), // Vertical spacing
            SizedBox(height: 5.v), // Vertical spacing
            Divider(
              height: 1.v, // Divider height
              thickness: 1.v, // Divider thickness
              color: appTheme.blueGray400, // Divider color
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event to navigate to different screens
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName); // Navigating to the specified route
  }
}