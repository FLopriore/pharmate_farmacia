// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pharmacy _$PharmacyFromJson(Map<String, dynamic> json) => Pharmacy(
      json['codice_farmacia'] as String,
      json['nome'] as String,
      json['citta'] as String,
    );

Map<String, dynamic> _$PharmacyToJson(Pharmacy instance) =>
    <String, dynamic>{
      'codice_farmacia': instance.codice_farmacia,
      'nome': instance.nome,
      'citta': instance.citta,
    };
