import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/cancel_button.dart';

class BookingSheetHeader extends StatelessWidget {
  const BookingSheetHeader(
      {Key? key,
      required this.title,
      required this.showBackButton,
      required this.onBackButtonPress})
      : super(key: key);

  final String title;
  final bool showBackButton;
  final VoidCallback onBackButtonPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: onBackButtonPress,
            ),
          if (showBackButton) SizedBox(width: kSpaceXXSmall),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.textTheme.headline1),
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
    );
  }
}
