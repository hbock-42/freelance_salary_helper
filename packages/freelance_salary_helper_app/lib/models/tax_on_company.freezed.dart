// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'tax_on_company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaxOnCompany _$TaxOnCompanyFromJson(Map<String, dynamic> json) {
  return _TaxOnCompany.fromJson(json);
}

class _$TaxOnCompanyTearOff {
  const _$TaxOnCompanyTearOff();

  _TaxOnCompany call({@required int limit, @required double rate}) {
    return _TaxOnCompany(
      limit: limit,
      rate: rate,
    );
  }
}

// ignore: unused_element
const $TaxOnCompany = _$TaxOnCompanyTearOff();

mixin _$TaxOnCompany {
  int get limit;
  double get rate;

  Map<String, dynamic> toJson();
  $TaxOnCompanyCopyWith<TaxOnCompany> get copyWith;
}

abstract class $TaxOnCompanyCopyWith<$Res> {
  factory $TaxOnCompanyCopyWith(
          TaxOnCompany value, $Res Function(TaxOnCompany) then) =
      _$TaxOnCompanyCopyWithImpl<$Res>;
  $Res call({int limit, double rate});
}

class _$TaxOnCompanyCopyWithImpl<$Res> implements $TaxOnCompanyCopyWith<$Res> {
  _$TaxOnCompanyCopyWithImpl(this._value, this._then);

  final TaxOnCompany _value;
  // ignore: unused_field
  final $Res Function(TaxOnCompany) _then;

  @override
  $Res call({
    Object limit = freezed,
    Object rate = freezed,
  }) {
    return _then(_value.copyWith(
      limit: limit == freezed ? _value.limit : limit as int,
      rate: rate == freezed ? _value.rate : rate as double,
    ));
  }
}

abstract class _$TaxOnCompanyCopyWith<$Res>
    implements $TaxOnCompanyCopyWith<$Res> {
  factory _$TaxOnCompanyCopyWith(
          _TaxOnCompany value, $Res Function(_TaxOnCompany) then) =
      __$TaxOnCompanyCopyWithImpl<$Res>;
  @override
  $Res call({int limit, double rate});
}

class __$TaxOnCompanyCopyWithImpl<$Res> extends _$TaxOnCompanyCopyWithImpl<$Res>
    implements _$TaxOnCompanyCopyWith<$Res> {
  __$TaxOnCompanyCopyWithImpl(
      _TaxOnCompany _value, $Res Function(_TaxOnCompany) _then)
      : super(_value, (v) => _then(v as _TaxOnCompany));

  @override
  _TaxOnCompany get _value => super._value as _TaxOnCompany;

  @override
  $Res call({
    Object limit = freezed,
    Object rate = freezed,
  }) {
    return _then(_TaxOnCompany(
      limit: limit == freezed ? _value.limit : limit as int,
      rate: rate == freezed ? _value.rate : rate as double,
    ));
  }
}

@JsonSerializable()
class _$_TaxOnCompany with DiagnosticableTreeMixin implements _TaxOnCompany {
  _$_TaxOnCompany({@required this.limit, @required this.rate})
      : assert(limit != null),
        assert(rate != null);

  factory _$_TaxOnCompany.fromJson(Map<String, dynamic> json) =>
      _$_$_TaxOnCompanyFromJson(json);

  @override
  final int limit;
  @override
  final double rate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaxOnCompany(limit: $limit, rate: $rate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaxOnCompany'))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('rate', rate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaxOnCompany &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(rate);

  @override
  _$TaxOnCompanyCopyWith<_TaxOnCompany> get copyWith =>
      __$TaxOnCompanyCopyWithImpl<_TaxOnCompany>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaxOnCompanyToJson(this);
  }
}

abstract class _TaxOnCompany implements TaxOnCompany {
  factory _TaxOnCompany({@required int limit, @required double rate}) =
      _$_TaxOnCompany;

  factory _TaxOnCompany.fromJson(Map<String, dynamic> json) =
      _$_TaxOnCompany.fromJson;

  @override
  int get limit;
  @override
  double get rate;
  @override
  _$TaxOnCompanyCopyWith<_TaxOnCompany> get copyWith;
}
