import 'package:flutter/material.dart';

import 'package:simple_booking_ui/ui/theme/colors.dart';
import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/ui/theme/text_styles.dart';

final theme = ThemeData(
    fontFamily: 'Inter',
    colorScheme: ColorScheme(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        onPrimary: kBackgroundColor,
        surface: kBackgroundColor,
        onSurface: kBorderColor,
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
          EdgeInsets.symmetric(vertical: kSpaceXSmall, horizontal: kSpaceSmall),
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
      hintStyle: overline,
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
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return subtitle2.copyWith(color: kLightTextColor);
          } else {
            return subtitle2;
          }
        }),
      ),
    ),
    textTheme: TextTheme(
        headline1: headline1,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        button: button,
        caption: caption,
        overline: overline));
