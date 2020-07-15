import 'package:flutter/material.dart';
import 'package:freelance_salary_helper_app/ui/themes/slider_theme_data.dart';
import 'package:freelance_salary_helper_app/ui/themes/text_styles.dart';

import 'home_page.dart';

class EntryAfterLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        sliderTheme: CustomSliderThemeData(),
        textTheme: TextTheme(
          bodyText2: TextStyles.defaultText,
        ),
      ),
      home: Material(child: HomePage()),
    );
  }
}
