import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:flutter/painting.dart';

enum MoodEnum {
  bad(CustomColors.red),
  normal(CustomColors.yellow),
  good(CustomColors.green);

  final Color color;

  const MoodEnum(this.color);
}
