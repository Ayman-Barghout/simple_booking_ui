import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:simple_booking_ui/helpers/ui/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/ui_helpers.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            tr(LocaleKeys.greeting)), //* <-- Generated LocaleKeys usage example
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.home_screen_body,
              style: context.textTheme.headline5,
            ).tr(),
            SizedBox(
              height: kSpaceSmall,
            ),
          ],
        ),
      ),
    );
  }
}
