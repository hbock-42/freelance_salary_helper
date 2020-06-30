import 'package:flutter/material.dart';
import 'package:freelance_salary_helper_app/ui/pages/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: Directionality(
          textDirection: TextDirection.ltr, child: LoadingPage())));
}
