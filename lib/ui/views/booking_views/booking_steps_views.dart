import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class NameStep extends StatelessWidget {
  const NameStep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            tr(LocaleKeys.nameStepPrompt),
            style: context.textTheme.bodyText1,
          ),
          const SizedBox(
            height: kSpaceXXLarge,
          ),
          TextFormField(
            style: context.textTheme.subtitle1,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: tr(LocaleKeys.labels_fullName)),
          ),
          const SizedBox(
            height: kSpaceMedium,
          ),
          CustomElevatedButton(
            text: tr(LocaleKeys.userActions_continue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
