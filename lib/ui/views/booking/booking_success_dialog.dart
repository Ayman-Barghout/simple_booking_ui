import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusMedium)),
      backgroundColor: context.colorScheme.background,
      content: Padding(
        padding: const EdgeInsets.all(kSpaceLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tr(LocaleKeys.bookingSteps_complete),
              style: context.textTheme.headline2,
            ),
            const SizedBox(
              height: kSpaceXXLarge,
            ),
            CustomElevatedButton(
                text: tr(LocaleKeys.userActions_dismiss),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
