import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/providers/booking_views_provider.dart';
import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class NameStepView extends StatefulWidget {
  const NameStepView({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);
  final VoidCallback onSuccess;

  @override
  _NameStepViewState createState() => _NameStepViewState();
}

class _NameStepViewState extends State<NameStepView> {
  final _formStateKey = GlobalKey<FormState>();
  String? fullName;

  @override
  void initState() {
    super.initState();
    fullName = context.read(bookingInfoProvider.state).fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpaceMedium),
      child: Form(
        key: _formStateKey,
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
            Padding(
              padding: const EdgeInsets.only(right: kSpaceMedium),
              child: TextFormField(
                initialValue: fullName,
                style: context.textTheme.subtitle1,
                decoration:
                    InputDecoration(labelText: tr(LocaleKeys.labels_fullName)),
                onChanged: (value) {
                  fullName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr(LocaleKeys.validation_required);
                  } else if (value.length < 3) {
                    return plural(LocaleKeys.validation_minLength, 3);
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: kSpaceMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(right: kSpaceMedium),
              child: CustomElevatedButton(
                text: tr(LocaleKeys.userActions_continue),
                onPressed: () {
                  if (_formStateKey.currentState != null &&
                      _formStateKey.currentState!.validate()) {
                    context.read(bookingInfoProvider).updateFullName(fullName!);
                    context.closeKeyboard();
                    widget.onSuccess();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
