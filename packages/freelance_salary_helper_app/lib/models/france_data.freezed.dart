// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'france_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FranceData _$FranceDataFromJson(Map<String, dynamic> json) {
  return _FranceData.fromJson(json);
}

class _$FranceDataTearOff {
  const _$FranceDataTearOff();

  _FranceData call(
      {@required double tvaRate,
      @required double chargesRatronalesRate,
      @required double chargesSalarialesRate,
      @required List<TaxOnCompany> taxesOnCompany,
      @required double dividendRate}) {
    return _FranceData(
      tvaRate: tvaRate,
      chargesRatronalesRate: chargesRatronalesRate,
      chargesSalarialesRate: chargesSalarialesRate,
      taxesOnCompany: taxesOnCompany,
      dividendRate: dividendRate,
    );
  }
}

// ignore: unused_element
const $FranceData = _$FranceDataTearOff();

mixin _$FranceData {
  double get tvaRate;
  double get chargesRatronalesRate;
  double get chargesSalarialesRate;
  List<TaxOnCompany> get taxesOnCompany;
  double get dividendRate;

  Map<String, dynamic> toJson();
  $FranceDataCopyWith<FranceData> get copyWith;
}

abstract class $FranceDataCopyWith<$Res> {
  factory $FranceDataCopyWith(
          FranceData value, $Res Function(FranceData) then) =
      _$FranceDataCopyWithImpl<$Res>;
  $Res call(
      {double tvaRate,
      double chargesRatronalesRate,
      double chargesSalarialesRate,
      List<TaxOnCompany> taxesOnCompany,
      double dividendRate});
}

class _$FranceDataCopyWithImpl<$Res> implements $FranceDataCopyWith<$Res> {
  _$FranceDataCopyWithImpl(this._value, this._then);

  final FranceData _value;
  // ignore: unused_field
  final $Res Function(FranceData) _then;

  @override
  $Res call({
    Object tvaRate = freezed,
    Object chargesRatronalesRate = freezed,
    Object chargesSalarialesRate = freezed,
    Object taxesOnCompany = freezed,
    Object dividendRate = freezed,
  }) {
    return _then(_value.copyWith(
      tvaRate: tvaRate == freezed ? _value.tvaRate : tvaRate as double,
      chargesRatronalesRate: chargesRatronalesRate == freezed
          ? _value.chargesRatronalesRate
          : chargesRatronalesRate as double,
      chargesSalarialesRate: chargesSalarialesRate == freezed
          ? _value.chargesSalarialesRate
          : chargesSalarialesRate as double,
      taxesOnCompany: taxesOnCompany == freezed
          ? _value.taxesOnCompany
          : taxesOnCompany as List<TaxOnCompany>,
      dividendRate: dividendRate == freezed
          ? _value.dividendRate
          : dividendRate as double,
    ));
  }
}

abstract class _$FranceDataCopyWith<$Res> implements $FranceDataCopyWith<$Res> {
  factory _$FranceDataCopyWith(
          _FranceData value, $Res Function(_FranceData) then) =
      __$FranceDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {double tvaRate,
      double chargesRatronalesRate,
      double chargesSalarialesRate,
      List<TaxOnCompany> taxesOnCompany,
      double dividendRate});
}

class __$FranceDataCopyWithImpl<$Res> extends _$FranceDataCopyWithImpl<$Res>
    implements _$FranceDataCopyWith<$Res> {
  __$FranceDataCopyWithImpl(
      _FranceData _value, $Res Function(_FranceData) _then)
      : super(_value, (v) => _then(v as _FranceData));

  @override
  _FranceData get _value => super._value as _FranceData;

  @override
  $Res call({
    Object tvaRate = freezed,
    Object chargesRatronalesRate = freezed,
    Object chargesSalarialesRate = freezed,
    Object taxesOnCompany = freezed,
    Object dividendRate = freezed,
  }) {
    return _then(_FranceData(
      tvaRate: tvaRate == freezed ? _value.tvaRate : tvaRate as double,
      chargesRatronalesRate: chargesRatronalesRate == freezed
          ? _value.chargesRatronalesRate
          : chargesRatronalesRate as double,
      chargesSalarialesRate: chargesSalarialesRate == freezed
          ? _value.chargesSalarialesRate
          : chargesSalarialesRate as double,
      taxesOnCompany: taxesOnCompany == freezed
          ? _value.taxesOnCompany
          : taxesOnCompany as List<TaxOnCompany>,
      dividendRate: dividendRate == freezed
          ? _value.dividendRate
          : dividendRate as double,
    ));
  }
}

@JsonSerializable()
class _$_FranceData with DiagnosticableTreeMixin implements _FranceData {
  _$_FranceData(
      {@required this.tvaRate,
      @required this.chargesRatronalesRate,
      @required this.chargesSalarialesRate,
      @required this.taxesOnCompany,
      @required this.dividendRate})
      : assert(tvaRate != null),
        assert(chargesRatronalesRate != null),
        assert(chargesSalarialesRate != null),
        assert(taxesOnCompany != null),
        assert(dividendRate != null);

  factory _$_FranceData.fromJson(Map<String, dynamic> json) =>
      _$_$_FranceDataFromJson(json);

  @override
  final double tvaRate;
  @override
  final double chargesRatronalesRate;
  @override
  final double chargesSalarialesRate;
  @override
  final List<TaxOnCompany> taxesOnCompany;
  @override
  final double dividendRate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FranceData(tvaRate: $tvaRate, chargesRatronalesRate: $chargesRatronalesRate, chargesSalarialesRate: $chargesSalarialesRate, taxesOnCompany: $taxesOnCompany, dividendRate: $dividendRate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FranceData'))
      ..add(DiagnosticsProperty('tvaRate', tvaRate))
      ..add(DiagnosticsProperty('chargesRatronalesRate', chargesRatronalesRate))
      ..add(DiagnosticsProperty('chargesSalarialesRate', chargesSalarialesRate))
      ..add(DiagnosticsProperty('taxesOnCompany', taxesOnCompany))
      ..add(DiagnosticsProperty('dividendRate', dividendRate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FranceData &&
            (identical(other.tvaRate, tvaRate) ||
                const DeepCollectionEquality()
                    .equals(other.tvaRate, tvaRate)) &&
            (identical(other.chargesRatronalesRate, chargesRatronalesRate) ||
                const DeepCollectionEquality().equals(
                    other.chargesRatronalesRate, chargesRatronalesRate)) &&
            (identical(other.chargesSalarialesRate, chargesSalarialesRate) ||
                const DeepCollectionEquality().equals(
                    other.chargesSalarialesRate, chargesSalarialesRate)) &&
            (identical(other.taxesOnCompany, taxesOnCompany) ||
                const DeepCollectionEquality()
                    .equals(other.taxesOnCompany, taxesOnCompany)) &&
            (identical(other.dividendRate, dividendRate) ||
                const DeepCollectionEquality()
                    .equals(other.dividendRate, dividendRate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tvaRate) ^
      const DeepCollectionEquality().hash(chargesRatronalesRate) ^
      const DeepCollectionEquality().hash(chargesSalarialesRate) ^
      const DeepCollectionEquality().hash(taxesOnCompany) ^
      const DeepCollectionEquality().hash(dividendRate);

  @override
  _$FranceDataCopyWith<_FranceData> get copyWith =>
      __$FranceDataCopyWithImpl<_FranceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FranceDataToJson(this);
  }
}

abstract class _FranceData implements FranceData {
  factory _FranceData(
      {@required double tvaRate,
      @required double chargesRatronalesRate,
      @required double chargesSalarialesRate,
      @required List<TaxOnCompany> taxesOnCompany,
      @required double dividendRate}) = _$_FranceData;

  factory _FranceData.fromJson(Map<String, dynamic> json) =
      _$_FranceData.fromJson;

  @override
  double get tvaRate;
  @override
  double get chargesRatronalesRate;
  @override
  double get chargesSalarialesRate;
  @override
  List<TaxOnCompany> get taxesOnCompany;
  @override
  double get dividendRate;
  @override
  _$FranceDataCopyWith<_FranceData> get copyWith;
}
