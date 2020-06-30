import 'package:freelance_salary_helper_app/models/tax_on_company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'france_data.freezed.dart';
part 'france_data.g.dart';

@freezed
abstract class FranceData with _$FranceData {
  factory FranceData({
    @required double tvaRate,
    @required double chargesRatronalesRate,
    @required double chargesSalarialesRate,
    @required List<TaxOnCompany> taxesOnCompany,
    @required double dividendRate,
  }) = _FranceData;
  factory FranceData.fromJson(Map<String, dynamic> json) =>
      _$FranceDataFromJson(json);
}
