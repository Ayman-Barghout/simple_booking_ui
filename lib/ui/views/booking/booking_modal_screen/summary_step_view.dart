import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/helpers/helper_methods.dart';
import 'package:simple_booking_ui/providers/booking/booking_views_provider.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class SummaryStepView extends StatelessWidget {
  const SummaryStepView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpaceMedium),
      child: Consumer(builder: (context, watch, child) {
        final bookingInfo = watch(bookingViewsProvider.state);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // BookingInfo's fullName is nullable so we need to check
            if (bookingInfo.fullName != null)
              SummaryEntry(
                title: tr(LocaleKeys.bookingSteps_name),
                value: bookingInfo.fullName!,
              ),
            SummaryEntry(
              title: tr(LocaleKeys.bookingSteps_budget),
              value: getTextForBudget(bookingInfo.budget),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: kSpaceMedium),
              child: Consumer(builder: (context, watch, child) {
                final isConfirming = watch(isConfirmingBooking).state;
                return CustomElevatedButton(
                  key: const ValueKey("summaryStepButton"),
                  text: tr(isConfirming
                      ? LocaleKeys.confirming
                      : LocaleKeys.userActions_confirmBooking),
                  leading: isConfirming
                      ? Theme(
                          data: context.theme
                              .copyWith(brightness: Brightness.dark),
                          child: const CupertinoActivityIndicator(
                            radius: 12,
                          ))
                      : null,
                  onPressed: () async {
                    context.read(isConfirmingBooking).state = true;
                    final result = await context
                        .read(bookingViewsProvider)
                        .confirmBooking();

                    Navigator.of(context).pop<bool>(result);
                  },
                );
              }),
            ),
            const Spacer(),
          ],
        );
      }),
    );
  }
}

class SummaryEntry extends StatelessWidget {
  const SummaryEntry({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.caption),
        const SizedBox(height: kSpaceXXSmall),
        Text(value,
            style: context.textTheme.button!
                .copyWith(color: context.colorScheme.primary)),
        const SizedBox(height: kSpaceXSmall),
        const Divider(),
        const SizedBox(height: kSpaceXSmall),
      ],
    );
  }
}
