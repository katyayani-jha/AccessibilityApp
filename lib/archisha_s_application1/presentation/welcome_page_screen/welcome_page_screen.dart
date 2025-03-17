import 'package:accessibility_app/archisha_s_application1/widgets/custom_elevated_button.dart';
import 'package:accessibility_app/archisha_s_application1/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:accessibility_app/archisha_s_application1/core/app_export.dart';
import 'package:accessibility_app/archisha_s_application1/presentation/sign_up_screen/sign_up_screen.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.gray100,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.gray100,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgWelcomePage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                _buildFive(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 31.h,
        vertical: 38.v,
      ),
      decoration: AppDecoration.outlineSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFC8E4), // Set the desired pink color
              borderRadius:
                  BorderRadius.circular(30.0), // Set desired corner radius
            ),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Text(
              "Let's get started!",
              style: CustomTextStyles.displaySmallOnSecondaryContainer.copyWith(
                color: const Color.fromARGB(
                    255, 18, 17, 17), // Set text color to white
              ),
            ),
          ),
          SizedBox(height: 26.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: "Login",
                  margin: EdgeInsets.only(right: 9.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.headlineLargeRed50,
                  onPressed: () {
                    // Navigate to LoginScreen when the Login button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  text: "Sign Up",
                  margin: EdgeInsets.only(left: 9.h),
                  buttonStyle: CustomButtonStyles.fillRedTL30,
                  onPressed: () {
                    // Navigate to the SignUpScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24.v),
          Container(
            width: 399.h,
            margin: EdgeInsets.symmetric(horizontal: 50.h),
            child: Text(
              "A space to communicate ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall,
            ),
          ),
          SizedBox(height: 23.v),
        ],
      ),
    );
  }
}
