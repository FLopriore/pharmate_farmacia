import 'package:json_annotation/json_annotation.dart';

/// This allows the `Medicine` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'medicine.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Medicine {
  String codeItem; // AIC code of the medicine
  String name; // name of the medicine
  int qta; // number of items available in the warehouse

  Medicine(this.codeItem, this.name, this.qta);

  /// A necessary factory constructor for creating a new Medicine instance
  /// from a map. Pass the map to the generated `_$MedicineFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Medicine.
  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$MedicineToJson`.
  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
