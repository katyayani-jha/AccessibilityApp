import 'package:accessibility_app/archisha_s_application1/theme/theme_helper.dart';
import 'package:accessibility_app/archisha_s_application1/widgets/custom_icon_button.dart';
import 'package:accessibility_app/archisha_s_application1/widgets/custom_text_form_field.dart';
import 'package:accessibility_app/archisha_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:accessibility_app/archisha_s_application1/core/app_export.dart'
    as chiku;
import 'package:accessibility_app/srestha_s_application4/core/app_export.dart'
    as srestha;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true; // State to track password visibility

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: chiku.SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: chiku.SizeUtils.height,
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 565,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildSeventeen(context),
                            _buildFourteen(context),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        "Or continue with",
                        style: chiku.theme.textTheme.headlineMedium,
                      ),
                      SizedBox(height: 15),
                      _buildTwentySeven(context),
                      Spacer(),
                      SizedBox(height: 44),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: chiku.CustomTextStyles.titleLargeffffffff,
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: chiku.CustomTextStyles.titleLargeff1f1bd1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventeen(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 425,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            chiku.CustomImageView(
              imagePath: chiku.ImageConstant.imgAppDoodle31,
              height: 425,
              width: 430,
              radius: BorderRadius.circular(
                30,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 27,
                top: 29,
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: CustomIconButton(
                  height: 54,
                  width: 54,
                  padding: EdgeInsets.all(14),
                  alignment: Alignment.topLeft,
                  child: chiku.CustomImageView(
                    imagePath: chiku.ImageConstant.imgArrowDown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 17,
        right: 16,
      ),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  /// Section Widget
  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              // Toggle password visibility
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
        obscureText: _isObscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget

  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        text: "Continue",
        buttonStyle: chiku.CustomButtonStyles.fillPrimary,
        buttonTextStyle: chiku.CustomTextStyles.headlineLargeRed50,
        onPressed: () {
          // Validate the form
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => srestha.Sizer(
                builder: (context, orientation, deviceType) {
                  return MaterialApp(
                    theme: theme,
                    title: 'srestha_s_application4',
                    debugShowCheckedModeBanner: false,
                    initialRoute: srestha.AppRoutes.landingPageScreen,
                    routes: srestha.AppRoutes.routes,
                  );
                },
              ),
            ),
          );
        });
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 19),
        padding: EdgeInsets.symmetric(
          horizontal: 29,
          vertical: 15,
        ),
        decoration: chiku.AppDecoration.outlineSecondaryContainer1.copyWith(
          borderRadius: chiku.BorderRadiusStyle.roundedBorder30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Login",
              style: chiku.theme.textTheme.displayMedium,
            ),
            SizedBox(height: 4),
            _buildEmail(context),
            SizedBox(height: 16),
            _buildPassword(context),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  "Forgot Password?",
                  style: chiku.theme.textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(height: 13),
            _buildContinue(context),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGoogle(BuildContext context) {
    return CustomElevatedButton(
      width: 175,
      text: "Google",
    );
  }

  /// Section Widget
  Widget _buildApple(BuildContext context) {
    return CustomElevatedButton(
      width: 175,
      text: "Apple",
      margin: EdgeInsets.only(left: 21),
    );
  }

  /// Section Widget
  Widget _buildTwentySeven(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGoogle(context),
          _buildApple(context),
        ],
      ),
    );
  }
}
