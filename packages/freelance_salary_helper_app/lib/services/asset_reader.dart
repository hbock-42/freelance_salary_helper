import 'package:flutter/services.dart';

class AssetReader {
  static Future<String> readAsStringFromAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}
