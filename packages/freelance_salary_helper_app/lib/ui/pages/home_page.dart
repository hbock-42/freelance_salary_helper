import 'package:flutter/material.dart';
import 'loading_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoadingPage(),
    );
  }
}
