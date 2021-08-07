import 'package:flutter/material.dart';

import 'package:simple_booking_ui/ui/theme/colors.dart';
import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/ui/theme/text_styles.dart';

final theme = ThemeData(
    fontFamily: 'Inter',
    colorScheme: const ColorScheme(
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
      contentPadding: const EdgeInsets.symmetric(
          vertical: kSpaceXSmall, horizontal: kSpaceSmall),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        borderSide: const BorderSide(color: kBorderColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        borderSide: const BorderSide(color: kBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        borderSide: const BorderSide(color: kSecondaryColor, width: 2),
      ),
      alignLabelWithHint: true,
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
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return subtitle2.copyWith(color: kLightTextColor);
          } else {
            return subtitle2;
          }
        }),
      ),
    ),
    textTheme: const TextTheme(
        headline1: headline1,
        headline2: headline2,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        button: button,
        caption: caption,
        overline: overline));
