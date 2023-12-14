// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['uuid'] as int,
      Pharmacy.fromJson(json['farmacia'] as Map<String, dynamic>),
      User.fromJson(json['utente'] as Map<String, dynamic>),
      Medicine.fromJson(json['prodotto'] as Map<String, dynamic>),
      json['quantita'] as int,
      json['date'] as String,
      $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$OrderToJson(Order instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'farmacia': instance.farmacia.toJson(),
      'utente': instance.utente.toJson(),
      'prodotto': instance.prodotto.toJson(),
      'quantita': instance.quantita,
      'status': _$StatusEnumMap[instance.status]!,
      'date': instance.date,
    };

const _$StatusEnumMap = {
  Status.red: 'PENDING',
  Status.yellow: 'ACCEPTED',
  Status.green: 'DELIVERED',
};
