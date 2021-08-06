import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/ui/views/booking_views/booking_steps_views.dart';
import 'package:simple_booking_ui/ui/views/booking_views/booking_sheet_header.dart';

class BookingBottomSheet extends StatefulWidget {
  const BookingBottomSheet({Key? key}) : super(key: key);

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  late PageController _pageController;

  final stepsTitles = <String>[
    tr(LocaleKeys.bookingSteps_name),
    tr(LocaleKeys.bookingSteps_budget),
    tr(LocaleKeys.bookingSteps_summary)
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

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
            BookingSheetHeader(),
            const SizedBox(
              height: kSpaceMedium,
            ),
            LinearProgressIndicator(
              minHeight: kSpaceXXSmall,
              value: 1 / stepsTitles.length,
              color: context.colorScheme.secondary,
            ),
            const SizedBox(
              height: kSpaceLarge,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  NameStep(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
