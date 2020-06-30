import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freelance_salary_helper_app/models/france_data.dart';
import 'package:freelance_salary_helper_app/services/asset_reader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entry_after_loading.dart';

final franceDataFutureProvider =
    FutureProvider((ref) async => _loadFranceData());
final franceDataStateProvider = StateProvider<FranceData>((ref) => null);

Future<FranceData> _loadFranceData() async {
  var franceDataJsonString = await AssetReader.readAsStringFromAsset(
      'assets/configs/countries_data/france.json');
  var franceData = FranceData.fromJson(jsonDecode(franceDataJsonString));
  return franceData;
}

class LoadingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<FranceData> snapshot =
        useProvider(franceDataFutureProvider);
    final StateController<FranceData> franceDataStateController =
        useProvider(franceDataStateProvider);
    return snapshot.when(
        data: (franceData) {
          franceDataStateController.state = franceData;
          return EntryAfterLoading();
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (obj, strackTrace) =>
            Center(child: Text('$strackTrace in $obj')));
  }
}
