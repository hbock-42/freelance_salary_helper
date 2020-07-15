import 'package:flutter/material.dart';
import 'package:freelance_salary_helper_app/ui/pages/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/number_symbols_data.dart';
import 'package:intl/number_symbols.dart';

void main() {
  numberFormatSymbols['zz'] = new NumberSymbols(
    NAME: "zz",
    DECIMAL_SEP: '.',
    GROUP_SEP: '\u00A0',
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'e',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '\u00A4#,##0.00',
    DEF_CURRENCY_CODE: 'AUD',
  );
  runApp(ProviderScope(
      child: Directionality(
          textDirection: TextDirection.ltr, child: LoadingPage())));
}
