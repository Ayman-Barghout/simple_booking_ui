import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:simple_booking_ui/ui/theme/colors.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';
import 'package:simple_booking_ui/ui/views/booking_views/booking_bottom_sheet.dart';

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
                  isDismissible: false,
                  barrierColor: kPrimaryColor.withOpacity(0.3),
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
