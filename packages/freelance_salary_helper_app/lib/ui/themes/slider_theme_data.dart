import 'package:flutter/material.dart';
import 'package:freelance_salary_helper_app/ui/themes/app_colors.dart';

class CustomSliderThemeData extends SliderThemeData {
  @override
  Color get activeTrackColor => AppColors.mainColor;
  @override
  Color get inactiveTrackColor => AppColors.mainColorBright;
  @override
  Color get thumbColor => AppColors.mainColor;
  @override
  Color get overlayColor => AppColors.mainColor.withOpacity(0.12);
  @override
  SliderTrackShape get trackShape => CustomTrackShape();
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
