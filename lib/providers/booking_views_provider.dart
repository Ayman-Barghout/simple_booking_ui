import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/models/booking_info.dart';
import 'package:simple_booking_ui/models/budget.dart';

final bookingInfoProvider = StateNotifierProvider<BookingViewsProvider>(
    (ref) => BookingViewsProvider());

class BookingViewsProvider extends StateNotifier<BookingInfo> {
  BookingViewsProvider() : super(BookingInfo.empty());

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateBudget(Budget budget) {
    state = state.copyWith(budget: budget);
  }

  bool validate() {
    return state.validate();
  }

  Future<bool> confirmBooking() async {
    return true;
  }

  void clear() {
    state = BookingInfo.empty();
  }
}
