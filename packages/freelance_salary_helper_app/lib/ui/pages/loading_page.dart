import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freelance_salary_helper_app/models/france_data.dart';
import 'package:freelance_salary_helper_app/services/asset_reader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final franceDataProvider = FutureProvider((ref) async => _loadFranceData());

Future<FranceData> _loadFranceData() async {
  var franceDataJsonString = await AssetReader.readAsStringFromAsset(
      'assets/configs/countries_data/france.json');
  var franceData = FranceData.fromJson(jsonDecode(franceDataJsonString));
  await Future.delayed(Duration(seconds: 1));
  print('loaded');
  return franceData;
}

class LoadingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<FranceData> snapshot = useProvider(franceDataProvider);

    return snapshot.when(
        data: (franceData) => Container(child: Center(child: Text("Loaded"))),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (obj, strackTrace) =>
            Center(child: Text('$strackTrace in $obj')));
  }
}

// class LoadingPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     return HookBuilder(
//       builder: (context) {
//         final Future<FranceData> future = useMemoized(() => _loadFranceData());
//         final AsyncSnapshot<FranceData> snapshot = useFuture(future);
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Container(
//             child: Center(
//               child: Text('Loaded'),
//             ),
//           );
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Future<FranceData> _loadFranceData() async {
//     var franceDataJsonString = await AssetReader.readAsStringFromAsset(
//         'assets/configs/countries_data/france.json');
//     var franceData = FranceData.fromJson(jsonDecode(franceDataJsonString));
//     await Future.delayed(Duration(seconds: 1));
//     print('loaded');
//     return franceData;
//   }
// }
