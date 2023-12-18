// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseItem _$AvailMedicineFromJson(Map<String, dynamic> json) =>
    WarehouseItem(
      Medicine.fromJson(json['prodotto'] as Map<String, dynamic>),
      json['quantita'] as int,
    );

Map<String, dynamic> _$AvailMedicineToJson(WarehouseItem instance) =>
    <String, dynamic>{
      'prodotto': instance.prodotto.toJson(),
      'quantita': instance.quantita,
    };
