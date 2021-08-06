import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';
import 'package:simple_booking_ui/ui/screens/booking_screen/booking_bottom_sheet.dart';

class InitiateBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
          child: CustomElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  builder: (context) => const BookingBottomSheet());
            },
            text: tr(LocaleKeys.userActions_startBooking),
          ),
        ),
      ),
    );
  }
}
