import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_booking_ui/theme/dimensions.dart';
import 'package:simple_booking_ui/helpers/ui/extensions.dart';

class SelectableOutlinedButton<T extends Object> extends StatelessWidget {
  const SelectableOutlinedButton(
      {Key? key,
      required this.text,
      this.height = 44,
      this.width = double.infinity,
      required this.value,
      required this.provider})
      : super(key: key);

  final T value;
  final String text;
  final double height;
  final double width;
  final StateProvider<T> provider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.read(provider).state != value) {
          context.read(provider).state = value;
        }
      },
      child: Consumer(builder: (context, watch, child) {
        final selected = watch(provider).state == value;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRadiusSmall),
            border: Border.all(
                width: selected ? 2 : 1,
                color: selected
                    ? context.colorScheme.secondary
                    : context.colorScheme.onSurface),
            color: context.colorScheme.background,
          ),
          child: Center(
            child: Text(
              text,
              style: context.textTheme.button!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
        );
      }),
    );
  }
}
