import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_booking_ui/models/booking/booking_info.dart';
import 'package:simple_booking_ui/services/booking/booking_service.dart';

final bookingServiceFirebaseProvider =
    Provider((ref) => BookingServiceFirebase());

class BookingServiceFirebase implements BookingService {
  @override
  Future<bool> confirmBooking(BookingInfo bookingInfo) async {
    final data = bookingInfo.toJson();
    await _addEntryToFirebase(data);
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<void> _addEntryToFirebase(Map<String, dynamic> data) async {
    // logic to saving to firebase here
  }
}
