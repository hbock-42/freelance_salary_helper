// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'france_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FranceData _$_$_FranceDataFromJson(Map<String, dynamic> json) {
  return _$_FranceData(
    tvaRate: (json['tvaRate'] as num)?.toDouble(),
    chargesRatronalesRate: (json['chargesRatronalesRate'] as num)?.toDouble(),
    chargesSalarialesRate: (json['chargesSalarialesRate'] as num)?.toDouble(),
    taxesOnCompany: (json['taxesOnCompany'] as List)
        ?.map((e) =>
            e == null ? null : TaxOnCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dividendRate: (json['dividendRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_FranceDataToJson(_$_FranceData instance) =>
    <String, dynamic>{
      'tvaRate': instance.tvaRate,
      'chargesRatronalesRate': instance.chargesRatronalesRate,
      'chargesSalarialesRate': instance.chargesSalarialesRate,
      'taxesOnCompany': instance.taxesOnCompany,
      'dividendRate': instance.dividendRate,
    };
