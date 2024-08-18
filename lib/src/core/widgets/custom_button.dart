import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, this.padding});
  final VoidCallback? onPressed;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory),
        child: TextButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(48)),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.pressed) ||
                      states.contains(WidgetState.disabled)
                  ? CustomColors.grey
                  : CustomColors.black,
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.pressed) ||
                      states.contains(WidgetState.disabled)
                  ? CustomColors.darkGrey
                  : Colors.white,
            ),
            shape: const WidgetStatePropertyAll(BeveledRectangleBorder()),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
