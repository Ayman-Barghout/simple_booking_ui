import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/ui/views/booking_views/booking_steps_views.dart';
import 'package:simple_booking_ui/ui/views/booking_views/booking_sheet_header.dart';

final currentStepProvider = StateProvider.autoDispose<double>((ref) => 0.0);

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
    _pageController.addListener(() {
      if (_pageController.page != null) {
        context.read(currentStepProvider).state = _pageController.page!;
      }
      print(_pageController.page);
    });
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
            Consumer(builder: (context, watch, child) {
              final currentPosition = watch(currentStepProvider).state;
              final currentPage = currentPosition.floor();
              return BookingSheetHeader(
                title: stepsTitles[currentPage],
                showBackButton: currentPage > 0,
                onBackButtonPress: () {
                  _pageController.animateToPage(currentPage - 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                },
              );
            }),
            const SizedBox(
              height: kSpaceMedium,
            ),
            Consumer(builder: (context, watch, child) {
              final currentPosition = watch(currentStepProvider).state;
              return LinearProgressIndicator(
                minHeight: kSpaceXXSmall,
                value: currentPosition + 1 / stepsTitles.length,
                color: context.colorScheme.secondary,
              );
            }),
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
