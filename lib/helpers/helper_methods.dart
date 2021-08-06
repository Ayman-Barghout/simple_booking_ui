import 'package:easy_localization/easy_localization.dart';
import 'package:simple_booking_ui/generated/locale_keys.g.dart';
import 'package:simple_booking_ui/models/budget.dart';

String getTextForBudget(Budget budget) {
  switch (budget) {
    case Budget.lowest:
      return "1 800 - 5 000 kr";
    case Budget.low:
      return "5 000 - 10 000 kr";
    case Budget.average:
      return "10 000 - 20 000 kr";
    case Budget.high:
      return "20 000 - 40 000 kr";
    case Budget.highest:
      return "${tr(LocaleKeys.over)} 40 000 kr";
  }
}
