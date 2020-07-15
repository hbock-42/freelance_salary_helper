import 'package:flutter/material.dart';
import 'package:freelance_salary_helper_app/ui/themes/app_colors.dart';

class TextStyles {
  static TextStyle defaultText = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );
  static TextStyle important = defaultText.apply(
    color: AppColors.mainColor,
    fontSizeFactor: 1.2,
  );
}
