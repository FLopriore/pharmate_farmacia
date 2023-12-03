// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      json['codeItem'] as String,
      json['name'] as String,
      json['qta'] as int,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'codeItem': instance.codeItem,
      'name': instance.name,
      'qta': instance.qta,
    };
