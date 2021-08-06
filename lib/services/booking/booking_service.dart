import 'package:simple_booking_ui/models/booking/booking_info.dart';

abstract class BookingService {
  Future<bool> confirmBooking(BookingInfo bookingInfo);
}
