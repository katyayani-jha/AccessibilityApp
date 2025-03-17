import 'package:accessibility_app/srestha_s_application4/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:accessibility_app/srestha_s_application4/core/app_export.dart';

class ProfileSetUpScreen extends StatelessWidget {
  const ProfileSetUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSeven(context),
              SizedBox(height: 59.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 46.h,
                    right: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgUser,
                        height: 56.v,
                        width: 36.h,
                        margin: EdgeInsets.only(top: 25.v),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgBookmark,
                        height: 34.v,
                        width: 11.h,
                        margin: EdgeInsets.only(
                          left: 8.h,
                          top: 36.v,
                          bottom: 11.v,
                        ),
                      ),
                      Container(
                        height: 70.v,
                        width: 261.h,
                        margin: EdgeInsets.only(
                          left: 18.h,
                          bottom: 11.v,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 33.v,
                                width: 261.h,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 14.v,
                                        width: 258.h,
                                        decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                        ),
                                        child: ClipRRect(
                                          child: LinearProgressIndicator(
                                            value: 0.11,
                                            backgroundColor:
                                                appTheme.blueGray100,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              theme.colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 33.v,
                                        width: 32.h,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            16.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "loudness",
                                style: theme.textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 42.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 42.h,
                    right: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img7926692001,
                        height: 58.adaptSize,
                        width: 58.adaptSize,
                        margin: EdgeInsets.only(top: 23.v),
                      ),
                      Container(
                        height: 69.v,
                        width: 259.h,
                        margin: EdgeInsets.only(
                          left: 21.h,
                          bottom: 12.v,
                        ),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 34.v,
                                width: 259.h,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 14.v,
                                        width: 256.h,
                                        decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                        ),
                                        child: ClipRRect(
                                          child: LinearProgressIndicator(
                                            value: 0.11,
                                            backgroundColor:
                                                appTheme.blueGray100,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              theme.colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 34.v,
                                        width: 31.h,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            17.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 89.h),
                                child: Text(
                                  "pitch",
                                  style: theme.textTheme.headlineLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 56.v),
              CustomElevatedButton(
                text: "Emergency contact",
                margin: EdgeInsets.only(
                  left: 23.h,
                  right: 36.h,
                ),
              ),
              SizedBox(height: 32.v),
              _buildNineteen(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 32.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.v),
          CustomImageView(
            imagePath: ImageConstant.imgArrowDown,
            height: 44.v,
            width: 38.h,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 12.v),
          SizedBox(
            height: 149.v,
            width: 152.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 149.v,
                    width: 152.h,
                    decoration: BoxDecoration(
                      color: appTheme.cyan300,
                      borderRadius: BorderRadius.circular(
                        76.h,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgLockOnprimary,
                  height: 66.v,
                  width: 64.h,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 26.v),
          Container(
            decoration: AppDecoration.outlineBlackF,
            child: Text(
              "username",
              style: CustomTextStyles.displayMediumBold,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNineteen(BuildContext context) {
    return Container(
      height: 76.v,
      width: 371.h,
      margin: EdgeInsets.only(left: 23.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomElevatedButton(
            height: 70.v,
            width: 371.h,
            text: "Medical info.",
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBottomCard,
            height: 76.v,
            width: 75.h,
            radius: BorderRadius.circular(
              37.h,
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 9.h),
          ),
        ],
      ),
    );
  }
}
