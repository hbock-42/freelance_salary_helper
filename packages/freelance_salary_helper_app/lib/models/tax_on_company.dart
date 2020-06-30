import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tax_on_company.freezed.dart';
part 'tax_on_company.g.dart';

@freezed
abstract class TaxOnCompany with _$TaxOnCompany {
  factory TaxOnCompany({@required int limit, @required double rate}) =
      _TaxOnCompany;
  factory TaxOnCompany.fromJson(Map<String, dynamic> json) =>
      _$TaxOnCompanyFromJson(json);
}
