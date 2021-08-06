import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class InitiateBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
          child: CustomElevatedButton(
            onPressed: () {},
            text: tr(LocaleKeys.userActions_startBooking),
          ),
        ),
      ),
    );
  }
}
