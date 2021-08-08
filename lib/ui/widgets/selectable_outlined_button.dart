import 'package:flutter/material.dart';

import 'package:simple_booking_ui/ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';

class SelectableOutlinedButton<T extends Object> extends StatelessWidget {
  const SelectableOutlinedButton(
      {Key? key,
      required this.text,
      this.height = 44,
      this.width = double.infinity,
      required this.value,
      required this.onSelected,
      required this.isSelected})
      : super(key: key);

  final T value;
  final String text;
  final double height;
  final double width;
  final VoidCallback onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected
                ? context.colorScheme.secondary
                : context.colorScheme.onSurface),
      ),
      child: Material(
        color: context.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusSmall),
        ),
        type: MaterialType.button,
        child: InkWell(
          onTap: () {
            onSelected();
          },
          child: Center(
            child: Text(
              text,
              style: context.textTheme.button!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
