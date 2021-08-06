import 'package:flutter/material.dart';
import 'package:simple_booking_ui/ui/theme/dimensions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.leading,
      this.height = 44,
      this.width = double.infinity})
      : super(key: key);
  final String text;
  final void Function()? onPressed;
  final Widget? leading;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading ?? const SizedBox(),
            if (leading != null) const SizedBox(width: kSpaceXSmall),
            Text(text),
          ],
        ),
      ),
    );
  }
}
