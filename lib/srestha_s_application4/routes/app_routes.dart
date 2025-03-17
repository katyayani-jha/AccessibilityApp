import 'package:flutter/material.dart';
import '../presentation/landing_page_screen/landing_page_screen.dart';
import '../presentation/landing_keyboard_screen/landing_keyboard_screen.dart';
import '../presentation/profile_set_up_screen/profile_set_up_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String landingPageScreen = '/landing_page_screen';

  static const String landingKeyboardScreen = '/landing_keyboard_screen';

  static const String profileSetUpScreen = '/profile_set_up_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    landingPageScreen: (context) => LandingPageScreen(),
    landingKeyboardScreen: (context) => LandingKeyboardScreen(),
    profileSetUpScreen: (context) => ProfileSetUpScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
