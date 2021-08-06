import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/helpers/helper_methods.dart';
import 'package:simple_booking_ui/models/budget.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';
import 'package:simple_booking_ui/ui/widgets/selectable_outlined_button.dart';

class BudgetStepView extends StatelessWidget {
  BudgetStepView({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            tr(LocaleKeys.budgetStepPrompt),
            style: context.textTheme.bodyText1,
          ),
          const SizedBox(
            height: kSpaceXXLarge,
          ),
          ...Budget.values
              .map<Widget>((budget) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SelectableOutlinedButton<Budget>(
                        text: getTextForBudget(budget),
                        value: budget,
                        provider: StateProvider<Budget>((ref) => Budget.low)),
                  ))
              .toList(),
          const SizedBox(
            height: kSpaceXSmall,
          ),
          CustomElevatedButton(
            text: tr(LocaleKeys.userActions_continue),
            onPressed: () {
              onSuccess();
            },
          ),
        ],
      ),
    );
  }
}
