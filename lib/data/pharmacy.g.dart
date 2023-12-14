// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pharmacy _$PharmacyFromJson(Map<String, dynamic> json) => Pharmacy(
      json['aic'] as String,
      json['nome'] as String,
      json['prezzo'] as num,
    );

Map<String, dynamic> _$PharmacyToJson(Pharmacy instance) => <String, dynamic>{
      'aic': instance.aic,
      'nome': instance.nome,
      'prezzo': instance.prezzo,
    };
