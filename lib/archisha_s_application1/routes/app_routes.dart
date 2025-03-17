import 'package:flutter/material.dart';
import '../presentation/welcome_page_screen/welcome_page_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/logged_out_screen/logged_out_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String welcomePageScreen = '/welcome_page_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String loginScreen = '/login_screen';

  static const String loggedOutScreen = '/logged_out_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    welcomePageScreen: (context) => WelcomePageScreen(),
    signUpScreen: (context) => SignUpScreen(),
    loginScreen: (context) => LoginScreen(),
    loggedOutScreen: (context) => LoggedOutScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
