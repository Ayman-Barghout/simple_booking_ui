import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/providers/booking/booking_views_provider.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/ui/widgets/cancel_button.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_modal_screen/budget_step_view.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_modal_screen/name_step_view.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_modal_screen/summary_step_view.dart';

/// A [StateProvider] for the current position of booking steps' [PageController]
final _currentPositionProvider =
    StateProvider.autoDispose<double>((ref) => 0.0);

final _currentPageProvider = Provider.autoDispose<int>(
    (ref) => ref.watch(_currentPositionProvider).state.round());

class BookingModalScreen extends StatefulWidget {
  const BookingModalScreen({Key? key}) : super(key: key);

  @override
  _BookingModalScreenState createState() => _BookingModalScreenState();
}

class _BookingModalScreenState extends State<BookingModalScreen> {
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
        context.read(_currentPositionProvider).state = _pageController.page!;
      }
    });
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.closeKeyboard();
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight * 0.93,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(kRadiusMedium)),
          ),
          padding: const EdgeInsets.only(top: kSpaceXLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer(builder: (context, watch, child) {
                final currentPage = watch(_currentPageProvider);

                return Header(
                  title: stepsTitles[currentPage],
                  showBackButton: currentPage > 0,
                  onBackButtonPress: () {
                    _animateToPage(currentPage - 1);
                  },
                );
              }),
              const SizedBox(
                height: kSpaceMedium,
              ),
              Consumer(builder: (context, watch, child) {
                final currentPosition = watch(_currentPositionProvider).state;
                final progress = (currentPosition + 1) / stepsTitles.length;

                return LinearProgressIndicator(
                  minHeight: kSpaceXXSmall,
                  value: progress,
                  color: context.colorScheme.secondary,
                );
              }),
              const SizedBox(
                height: kSpaceLarge,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    NameStepView(
                      onSuccess: () {
                        _animateToPage(1);
                      },
                    ),
                    BudgetStepView(
                      onSuccess: () {
                        _animateToPage(2);
                      },
                    ),
                    const SummaryStepView(),
                  ],
                ),
              ),
            ],
          ),
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

class Header extends StatelessWidget {
  const Header(
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
      child: Consumer(builder: (context, watch, child) {
        final isConfirming = watch(isConfirmingBooking).state;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBackButton)
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: isConfirming ? null : onBackButtonPress,
                  ),
                ),
              ),
            if (showBackButton) const SizedBox(width: kSpaceXXSmall),
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
            CancelButton(
                onPressed: isConfirming
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      })
          ],
        );
      }),
    );
  }
}
