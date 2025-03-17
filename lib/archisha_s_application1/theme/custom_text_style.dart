import 'package:flutter/material.dart';
// import 'package:archisha_s_application1/core/utils/size_utils.dart';
import 'package:accessibility_app/archisha_s_application1/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Display text style
  static get displaySmallOnSecondaryContainer =>
      theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      );
  // Headline text style
  static get headlineLargeOnSecondaryContainer =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeRed50 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.red50,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeff1f1bd1 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF1F1BD1),
      );
  static get titleLargeffffffff => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFFFFFFFF),
      );
}

extension on TextStyle {
  TextStyle get dongle {
    return copyWith(
      fontFamily: 'Dongle',
    );
  }
}
