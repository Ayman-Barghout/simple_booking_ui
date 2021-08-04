import 'package:flutter/material.dart';

import 'package:simple_booking_ui/theme/colors.dart';

final theme = ThemeData(
    fontFamily: 'Inter',
    accentColor: kPrimaryColor,
    primaryColor: kAccentColor,
    primaryColorLight: Colors.cyan[300],
    secondaryHeaderColor: Colors.black54,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: Colors.black.withOpacity(0.10),
    hintColor: kPrimaryColor,
    disabledColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    primaryIconTheme: const IconThemeData(color: Colors.black54),
    iconTheme: IconThemeData(color: kTextColor.withOpacity(0.45)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),

    // <------------------------------------------------ Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
        borderSide: BorderSide(color: kTextColor.withOpacity(0.5)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 0,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        color: kTextColor.withOpacity(0.7),
      ),
    ),
    textTheme: TextTheme());
