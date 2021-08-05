import 'package:flutter/material.dart';

import 'package:simple_booking_ui/theme/colors.dart';
import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/theme/text_styles.dart';

final theme = ThemeData(
    fontFamily: 'Inter',
    colorScheme: ColorScheme(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        onPrimary: kBackgroundColor,
        surface: kBackgroundColor,
        onSurface: kPrimaryColor,
        background: kBackgroundColor,
        primaryVariant: kPrimaryColor,
        onBackground: kPrimaryColor,
        onSecondary: kBackgroundColor,
        error: kErrorColor,
        onError: kPrimaryColor,
        brightness: Brightness.light,
        secondaryVariant: kSecondaryVariantColor),
    primaryIconTheme: const IconThemeData(color: kPrimaryColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          EdgeInsets.symmetric(vertical: kSpaceSmall, horizontal: kSpaceMedium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        gapPadding: 0,
        borderSide: BorderSide(color: kBorderColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        gapPadding: 0,
        borderSide: BorderSide(color: kBorderColor),
      ),
      labelStyle: overline,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(button),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadiusSmall),
            )),
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return kLightTextColor;
              } else {
                return kPrimaryColor;
              }
            }))),
    textTheme: TextTheme(
        headline1: headline1,
        subtitle1: subtitle1,
        bodyText1: bodyText1,
        button: button,
        caption: caption,
        overline: overline));
