import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/providers/booking_views_provider.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_bottom_sheet.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_success_dialog.dart';

class InitiateBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
          child: CustomElevatedButton(
            onPressed: () async {
              final result = await showModalBottomSheet<bool>(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      enableDrag: false,
                      barrierColor: const Color(0xFF7D7B7B),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(kRadiusMedium))),
                      builder: (context) => const BookingBottomSheet())
                  .whenComplete(
                      () => context.read(bookingInfoProvider).reset());

              if (result != null) {
                if (result) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor:
                          context.colorScheme.primary.withOpacity(0.3),
                      builder: (context) => const BookingSuccessDialog());
                } else {
                  // TODO: show booking failure widget here
                }
              }
            },
            text: tr(LocaleKeys.userActions_startBooking),
          ),
        ),
      ),
    );
  }
}
