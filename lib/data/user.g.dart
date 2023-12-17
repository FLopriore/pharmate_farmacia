// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Utente _$UtenteFromJson(Map<String, dynamic> json) => Utente(
      json['cf'] as String,
      json['fullname'] as String,
      json['citta'] as String,
      Pharmacy.fromJson(json['worksIn'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UtenteToJson(Utente instance) => <String, dynamic>{
      'cf': instance.cf,
      'fullname': instance.fullname,
      'citta': instance.citta,
      'favourite': instance.worksIn.toJson(),
    };
