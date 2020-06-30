// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_on_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaxOnCompany _$_$_TaxOnCompanyFromJson(Map<String, dynamic> json) {
  return _$_TaxOnCompany(
    limit: json['limit'] as int,
    rate: (json['rate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_TaxOnCompanyToJson(_$_TaxOnCompany instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'rate': instance.rate,
    };
