import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MoodBoxWidget extends StatelessWidget {
  const MoodBoxWidget(
      {super.key, this.size, this.color, this.borderWidth = 4, this.onTap});
  final double? size;
  final Color? color;
  final double borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth,
              color: CustomColors.black,
            ),
            color: color,
          ),
        ),
      ),
    );
  }
}
