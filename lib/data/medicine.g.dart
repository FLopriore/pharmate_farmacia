// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      json['aic'] as String,
      json['nome'] as String,
      json['prezzo'] as num,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'aic': instance.aic,
      'nome': instance.nome,
      'prezzo': instance.prezzo,
    };
