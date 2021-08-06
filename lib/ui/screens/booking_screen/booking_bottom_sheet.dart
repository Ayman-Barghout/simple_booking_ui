import 'package:flutter/material.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.93,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          color: Colors.white),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
