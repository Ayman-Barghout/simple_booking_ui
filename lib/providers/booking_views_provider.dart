import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/models/booking/booking_info.dart';
import 'package:simple_booking_ui/models/booking/budget.dart';
import 'package:simple_booking_ui/services/booking/booking_service.dart';
import 'package:simple_booking_ui/services/booking/booking_service_firebase.dart';

final isConfirmingBooking = StateProvider.autoDispose<bool>((ref) => false);

final bookingViewsProvider = StateNotifierProvider<BookingViewsProvider>((ref) {
  final bookingService = ref.watch(bookingServiceFirebaseProvider);
  return BookingViewsProvider(bookingService);
});

class BookingViewsProvider extends StateNotifier<BookingInfo> {
  BookingViewsProvider(this._bookingService) : super(BookingInfo.empty());

  final BookingService _bookingService;

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateBudget(Budget budget) {
    state = state.copyWith(budget: budget);
  }

  bool _isStateValid() {
    return state.validate();
  }

  Future<bool> confirmBooking() async {
    if (_isStateValid()) {
      return _bookingService.confirmBooking(state);
    } else {
      return false;
    }
  }

  void reset() {
    state = BookingInfo.empty();
  }
}
