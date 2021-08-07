import 'package:flutter_test/flutter_test.dart';
import 'package:simple_booking_ui/ui/views/booking/booking_modal_screen/booking_modal_screen.dart';
import 'package:simple_booking_ui/ui/views/booking/initiate_booking_screen.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Initiate booking screen', () {
    testWidgets('renders BookingScreen', (tester) async {
      await tester.pumpApp(InitiateBookingScreen());
      await tester.pumpAndSettle();
      expect(find.byType(InitiateBookingScreen), findsOneWidget);
      final initiateBookingButtonFinder = find.byType(CustomElevatedButton);
      expect(initiateBookingButtonFinder, findsOneWidget);
      await tester.tap(initiateBookingButtonFinder);
      await tester.pumpAndSettle();
      expect(find.byType(BookingModalScreen), findsOneWidget);
    });
  });
}
