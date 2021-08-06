// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingInfo _$BookingInfoFromJson(Map<String, dynamic> json) {
  return BookingInfo(
    fullName: json['fullName'] as String?,
    budget: _$enumDecode(_$BudgetEnumMap, json['budget']),
  );
}

Map<String, dynamic> _$BookingInfoToJson(BookingInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'budget': _$BudgetEnumMap[instance.budget],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$BudgetEnumMap = {
  Budget.lowest: 0,
  Budget.low: 1,
  Budget.average: 2,
  Budget.high: 3,
  Budget.highest: 4,
};
