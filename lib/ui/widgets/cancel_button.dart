import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/generated/locale_keys.g.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(tr(LocaleKeys.userActions_cancel)),
    );
  }
}
