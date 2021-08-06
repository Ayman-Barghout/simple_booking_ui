import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_booking_ui/app.dart';
import 'package:simple_booking_ui/ui/screens/booking_screen/initiate_booking_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders HomeScreen', (tester) async {
      await EasyLocalization.ensureInitialized();
      await tester.pumpWidget(App());
      await tester.pumpAndSettle();

      expect(find.byType(InitiateBookingScreen), findsOneWidget);
    });
  });
}
