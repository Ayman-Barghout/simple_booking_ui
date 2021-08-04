import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:simple_booking_ui/ui/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Builder(
        builder: (context) => MaterialApp(
            title: "Main app",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: HomeScreen()),
      ),
    );
  }
}
