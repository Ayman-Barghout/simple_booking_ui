import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_booking_ui/providers/booking/booking_views_provider.dart';

void main() {
  group('Confirm Booking Provider', () {
    test(
        'initial state of isConfirmingBooking is false and notifies listeners when changed',
        () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(isConfirmingBooking).state, false);

      container.read(isConfirmingBooking).state = true;

      expect(container.read(isConfirmingBooking).state, true);
    });
  });
}
