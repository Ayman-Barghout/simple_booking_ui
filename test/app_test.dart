import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_booking_ui/app.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/helpers/helper_methods.dart';
import 'package:simple_booking_ui/models/booking/budget.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_success_dialog.dart';
import 'package:simple_booking_ui/ui/views/booking/initiate_booking_screen.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_modal_screen/booking_modal_screen.dart';

void main() {
  group('App', () {
    testWidgets('happy case booking flow', (tester) async {
      await EasyLocalization.ensureInitialized();
      await tester.pumpWidget(ProviderScope(child: App()));
      await tester.pumpAndSettle();
      // Checking that the initiate booking screen is rendered
      expect(find.byType(InitiateBookingScreen), findsOneWidget);
      final initiateButtonFinder =
          find.text(tr(LocaleKeys.userActions_startBooking));
      expect(initiateButtonFinder, findsOneWidget);

      // Checking that modal opens when button is clicked
      await tester.tap(initiateButtonFinder);
      await tester.pumpAndSettle();
      expect(find.byType(BookingModalScreen), findsOneWidget);

      // Checking that validation is working when entering less than 3
      final nameTextFormFieldFinder = find.byType(TextFormField);
      final firstContinueButtonFinder =
          find.byKey(const ValueKey('nameStepButton'));
      expect(nameTextFormFieldFinder, findsOneWidget);
      await tester.enterText(nameTextFormFieldFinder, "Al");
      await tester.tap(firstContinueButtonFinder);
      await tester.pumpAndSettle();
      expect(find.text(plural(LocaleKeys.validation_minLength, 3)),
          findsOneWidget);
      // Checking that if fields validates, user will be moved to budget step
      await tester.enterText(nameTextFormFieldFinder, "Alek");
      await tester.tap(firstContinueButtonFinder);
      await tester.pumpAndSettle();
      expect(find.text(tr(LocaleKeys.nameStepPrompt)), findsNothing);
      expect(find.text(tr(LocaleKeys.budgetStepPrompt)), findsOneWidget);
      // Choosing a different budget than the default (lowest)
      final averageBudgetSelectableButtonFinder =
          find.text(getTextForBudget(Budget.average));
      expect(averageBudgetSelectableButtonFinder, findsOneWidget);
      await tester.tap(averageBudgetSelectableButtonFinder);
      // Checking that by clicking continue button the user will be moved to summary step
      final secondContinueButtonFinder =
          find.byKey(const ValueKey('budgetStepButton'));
      await tester.tap(secondContinueButtonFinder);
      await tester.pumpAndSettle();
      expect(find.text(tr(LocaleKeys.budgetStepPrompt)), findsNothing);
      expect(find.text(tr(LocaleKeys.bookingSteps_summary)), findsOneWidget);
      // Checking that the data entered in the previous steps are preserved,
      // This also tests the bookingViewsProvider
      expect(find.text('Alek'), findsOneWidget);
      expect(find.text(getTextForBudget(Budget.average)), findsOneWidget);
      // Confirming booking shows the booking complete dialog
      final confirmBookingButtonFinder =
          find.byKey(const ValueKey("summaryStepButton"));
      await tester.tap(confirmBookingButtonFinder);
      await tester.pumpAndSettle();
      expect(find.byType(BookingSuccessDialog), findsOneWidget);
    });
  });
}
