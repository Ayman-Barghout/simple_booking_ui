import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/providers/booking_views_provider.dart';
import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';

class NameStepView extends StatefulWidget {
  NameStepView({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);
  final VoidCallback onSuccess;

  @override
  _NameStepViewState createState() => _NameStepViewState();
}

class _NameStepViewState extends State<NameStepView> {
  final _formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
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
            Consumer(builder: (context, watch, child) {
              final fullName = watch(bookingInfoProvider.state).fullName;

              return TextFormField(
                initialValue: fullName,
                style: context.textTheme.subtitle1,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: tr(LocaleKeys.labels_fullName)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  } else if (value.length < 3) {
                    return "Name must be more than 3 letters";
                  } else {
                    return null;
                  }
                },
              );
            }),
            const SizedBox(
              height: kSpaceMedium,
            ),
            CustomElevatedButton(
              text: tr(LocaleKeys.userActions_continue),
              onPressed: () {
                if (_formStateKey.currentState != null &&
                    _formStateKey.currentState!.validate()) {
                  widget.onSuccess();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
