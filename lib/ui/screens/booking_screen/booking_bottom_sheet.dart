import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/ui/widgets/cancel_button.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.closeKeyboard();
      },
      child: Container(
        height: context.height * 0.93,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            color: Colors.white),
        padding: const EdgeInsets.only(top: kSpaceXLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpaceSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr(LocaleKeys.name),
                          style: context.textTheme.headline1),
                      const SizedBox(
                        height: kSpaceXSmall,
                      ),
                      Text(tr(LocaleKeys.bookForQuote),
                          style: context.textTheme.caption),
                    ],
                  ),
                  const Spacer(),
                  CancelButton(onPressed: () {
                    Navigator.of(context).pop();
                  })
                ],
              ),
            ),
            const SizedBox(
              height: kSpaceMedium,
            ),
            LinearProgressIndicator(
              minHeight: kSpaceXXSmall,
              value: 1 / 3,
              color: context.colorScheme.secondary,
            ),
            const SizedBox(
              height: kSpaceLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    tr(LocaleKeys.nameStepPrompt),
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: kSpaceXXLarge,
                  ),
                  TextFormField(
                    style: context.textTheme.subtitle1,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: tr(LocaleKeys.labels_fullName)),
                  ),
                  const SizedBox(
                    height: kSpaceMedium,
                  ),
                  CustomElevatedButton(
                    text: tr(LocaleKeys.userActions_continue),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
