import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_booking_ui/helpers/helper_methods.dart';
import 'package:simple_booking_ui/models/budget.dart';
import 'package:simple_booking_ui/providers/booking_views_provider.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/ui/widgets/custom_elevated_button.dart';
import 'package:simple_booking_ui/ui/widgets/selectable_outlined_button.dart';

class BudgetStepView extends StatelessWidget {
  const BudgetStepView({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: kSpaceMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: kSpaceXXSmall),
              child: Text(
                tr(LocaleKeys.budgetStepPrompt),
                style: context.textTheme.bodyText1,
              ),
            ),
            const SizedBox(
              height: kSpaceXXLarge,
            ),
            const Padding(
              padding: EdgeInsets.only(right: kSpaceMedium),
              child: BudgetsList(),
            ),
            const SizedBox(
              height: kSpaceXSmall,
            ),
            Padding(
              padding: const EdgeInsets.only(right: kSpaceMedium),
              child: CustomElevatedButton(
                text: tr(LocaleKeys.userActions_continue),
                onPressed: () {
                  onSuccess();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetsList extends StatelessWidget {
  const BudgetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Budget.values
          .map<Widget>((budget) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Consumer(builder: (context, watch, child) {
                  final currentBudget = watch(bookingInfoProvider.state).budget;
                  return SelectableOutlinedButton<Budget>(
                      text: getTextForBudget(budget),
                      value: budget,
                      onSelected: () {
                        context.read(bookingInfoProvider).updateBudget(budget);
                      },
                      isSelected: budget == currentBudget);
                }),
              ))
          .toList(),
    );
  }
}
